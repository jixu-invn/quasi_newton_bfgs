function [rx,i,dif]= BFGS2(f,t,y,a,x,H,m)
    Hk = H  
    xk = x
    gk =  numderivative(list(f, t, y,a), xk)'
    dk = -inv(Hk)*gk
    pk = armijo2(f,t,y,a,xk,dk,m)
    xkk = xk + pk*dk
    gkk = numderivative(list(f,t,y,a), xkk)'
    //disp(norm(xkk - xk))
    if norm(xkk - xk) < 10^(-9) then
        rx = xk
        i = 1
        dif =list(norm(xkk - xk))
    else
        yk = gkk-gk
        sk = xkk -xk
        Hkk = Hk + yk*yk'/(yk'*sk) - Hk*sk*sk'*Hk/(sk'*Hk*sk)
        [rx,i,dif] = BFGS2(f,t,y,a,xkk,Hkk)
        i = i +1
        dif($+1)= norm(xkk-xk)
    end
endfunction
