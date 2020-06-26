/*
Fonction de Newton
*/
function [rx,i,dif]= newton(f,x)  
    xk= x
    [gx,hx]=  numderivative(f, xk, [], [],"blockmat")
    xkk = xk - inv(hx)*gx'
    //disp(norm(xkk - xk))
    if norm(xkk - xk) < 10^(-9) then
        rx = xk
        i=1
        dif = list(norm(xkk - xk))
    else
        [rx,i,dif] = newton(f,xkk);
        i = i + 1
        dif($+1)= norm(xkk-xk)
    end
endfunction

/*
BFGS
*/
function [rx,i,dif]= BFGS(f,x,H,m,reg)
    Hk = H  
    xk = x
    gk =  numderivative(f, xk)'
    dk = -inv(Hk)*gk
    if (reg == "armijo") then
        pk = armijo(f,xk,dk,m(1))
    elseif (reg == "goldsein") then
        pk = goldsein(f,xk,dk,m(1),m(2))
    else
        pk = wolfe(f,xk,dk,m(1),m(2))
    end
   
    xkk = xk + pk*dk
    gkk = numderivative(f, xkk)'
    //  disp(norm(xkk - xk))
    if norm(xkk - xk) < 10^(-9) then
        rx = xk
        i = 1
        dif =list(norm(xkk - xk))
    else
        yk = gkk-gk
        sk = xkk -xk
        Hkk = Hk + yk*yk'/(yk'*sk) - Hk*sk*sk'*Hk/(sk'*Hk*sk)
        [rx,i,dif] = BFGS(f,xkk,Hkk); 
        i = i +1
        dif($+1)= norm(xkk-xk)
    end
endfunction
