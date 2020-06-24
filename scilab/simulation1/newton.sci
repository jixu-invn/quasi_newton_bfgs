function [rx,i,dif]= newton(f,p,x)  
    xk= x
    [gx,hx]=  numderivative(list(f, p), xk, [], [],"blockmat")
    xkk = xk - inv(hx)*gx'
    //disp(norm(xkk - xk))
    if norm(xkk - xk) < 10^(-9) then
        rx = xk
        i=1
        dif = list(norm(xkk - xk))
    else
        [rx,i,dif] = newton(f,p,xkk);
        i = i + 1
        dif($+1)= norm(xkk-xk)
    end
endfunction
