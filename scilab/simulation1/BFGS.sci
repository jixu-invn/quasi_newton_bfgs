/*
Pour initializer H = eye(2,2)
m est un qui est reel dans (0,1)
x=[-1;1]
p = 10 ou 100
*/
function [rx,i]= BFGS(f,p,x,H,m)

    Hk = H  
    xk = x
    gk =  numderivative(list(f, p), xk)'
    dk = -inv(Hk)*gk
    pk = armijo(f,p,xk,dk,m)
    xkk = xk + pk*dk
    gkk = numderivative(list(f, p), xkk)'
    //disp(norm(xkk - xk))
    if norm(xkk - xk) < 10^(-9) then
        rx = xk
        i = 0
    else
        yk = gkk-gk
        sk = xkk -xk
        Hkk = Hk + yk*yk'/(yk'*sk) - Hk*sk*sk'*Hk/(sk'*Hk*sk)
        [rx,i] = BFGS(f,p,xkk,Hkk); 
        i = i +1
    end
endfunction
