function rx= newton(f,p,x)  
    xk= x
    [gx,hx]=  numderivative(list(f, p), xk, [], [],"blockmat")
    xkk = xk - inv(hx)*gx'
    //disp(norm(xkk - xk))
    if norm(xkk - xk) < 10^(-9) then
        rx = xk;
    else
        rx = newton(f,p,xkk); 
    end
endfunction
