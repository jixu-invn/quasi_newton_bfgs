function [rx,i,dif]= newton2(f,t,y,a,x)  
    xk= x
    [gx,hx]=  numderivative(list(f, t, y,a), xk, [], [],"blockmat")
    xkk = xk - inv(hx)*gx'
    if norm(xkk - xk) < 10^(-9) then
        rx = xk
        i=1
        dif = list(norm(xkk - xk))
    else
        [rx,i,dif] = newton2(f,t,y,a ,xkk);
        i = i + 1
        dif($+1)= norm(xkk-xk)
    end
endfunction

