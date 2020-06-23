function x= newton(f,p,x)  
    xk= x
    [gx,hx]=  numderivative(list(f, p), x, [], [],"blockmat")
    xkk = xk - inv(hx)*gx'
    if xkk - xk < %eps then
        x = xk;
    else
        x = newton(f,p,xkk); 
    end
endfunction
