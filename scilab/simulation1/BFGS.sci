/*
Pour initializer H = eye(2,2)
m est un qui est reel dans (0,1)
x=[-1;1]
p = 10 ou 100
*/
function [rx,i,dif]= BFGS(f,p,x,H,m,reg)
    Hk = H  
    xk = x
    gk =  numderivative(list(f, p), xk)'
    dk = -inv(Hk)*gk
    if (reg == "armijo") then
        pk = armijo(f,p,xk,dk,m(1))
    elseif (reg == "goldsein") then
        pk = goldsein(f,p,xk,dk,m(1),m(2))
    else
        pk = wolfe(f,p,xk,dk,m(1),m(2))
    end
   
    xkk = xk + pk*dk
    gkk = numderivative(list(f, p), xkk)'
    //disp(norm(xkk - xk))
    if norm(xkk - xk) < 10^(-9) then
        rx = xk
        i = 1
        dif =list(norm(xkk - xk))
    else
        yk = gkk-gk
        sk = xkk -xk
        Hkk = Hk + yk*yk'/(yk'*sk) - Hk*sk*sk'*Hk/(sk'*Hk*sk)
        [rx,i,dif] = BFGS(f,p,xkk,Hkk); 
        i = i +1
        dif($+1)= norm(xkk-xk)
    end
endfunction
