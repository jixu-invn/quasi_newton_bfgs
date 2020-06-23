function pk = armijo(f,p,x,d,m)
    pk=1
    p1 = f(x+pk*d,p)
    p0 = f(x,p)+m* numderivative(list(f, p), x)'*pk
    while (p1 <= p0)
        pk= pk*2
    end
    pk = pk/2
endfunction
