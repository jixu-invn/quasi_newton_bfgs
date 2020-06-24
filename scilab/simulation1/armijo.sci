function pk = armijo(f,p,x,d,m)
    pk=1
    p1 = f(x+pk*d,p)
    p0 = f(x,p)+m* numderivative(list(f, p), x)*d*pk
    if (p1 <= p0) then
        while (p1 <= p0)
        pk= pk*2
        p1 = f(x+pk*d,p)
        p0 = f(x,p)+m* numderivative(list(f, p), x)*d*pk
        end
        pk = pk/2
    else
        while (p1 > p0)
        pk= pk/2
        p1 = f(x+pk*d,p)
        p0 = f(x,p)+m* numderivative(list(f, p), x)*d*pk
        end
    end
    
endfunction
