function pk = armijo2(f,t,y,a,x,d,m)
    pk=1
    p1 = f(x+pk*d,t,y)
    p0 = f(x,t,y)+m* numderivative(list(f, t,y,a), x)*d*pk
    if (p1<=p0) then
        while (p1 <= p0)
        pk= pk*2
        p1 = f(x+pk*d,t,y)
        p0 = f(x,t,y)+m* numderivative(list(f, t,y,a), x)*d*pk
    end
    pk = pk/2
    else
    while (p1 > p0)
        pk= pk/2
        p1 = f(x+pk*d,t,y)
        p0 = f(x,t,y)+m* numderivative(list(f, t,y,a), x)*d*pk
    end
    end

endfunction
