function rx= newton(f,p,x)  
    xk= x
    [gx,hx]=  numderivative(list(f, p), xk, [], [],"blockmat")
    xkk = xk - inv(hx)*gx'
    if xkk - xk < %eps then
        rx = xk;
    else
        rx = newton(f,p,xkk); 
    end
endfunction
