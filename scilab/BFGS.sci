/*
Pour initializer H = eyes(2,2)
m est un qui est reel dans (0,1)
x=[-1;1]
p = 10 ou 100
*/
function rx= BFGS(f,p,x,H,m)
    Hk = H  
    xk = x
    gk =  numderivative(list(f, p), xk)'
    dk = -inv(Hk)*gk
    pk = armijo(f,p,xk,dk,m)
    xkk = xk + pk*dk
    gkk = numderivative(list(f, p), xkk)'

    if xkk - xk < %eps then
        rx = xk;
    else
        yk = gkk-gk
        sk = xkk -xk
        Hkk = Hk + yk*yk'/(yk'*sk) - Hk*sk*sk'*Hk/(sk'*Hk*sk)
        rx = BFGS(f,p,xkk,Hkk); 
    end
endfunction
