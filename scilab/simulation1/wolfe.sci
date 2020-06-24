function pk = wolfe(f,p,x,d,m1,m2)
    pk=1
    p1 = f(x+pk*d,p)
    p2= f(x,p) + m1* numderivative(list(f, p), x)*d*pk
    p3 = m2* numderivative(list(f, p), x)*d
    if (p1>p2)  then
        while(p1>p2)
        pk= pk/2
        p1 = f(x+pk*d,p)
        p2= f(x,p) + m1* numderivative(list(f, p), x)*d*pk
        end
    elseif (p1 < p3)then
        while(p1 < p3)
        pk= pk*2
        p1 = f(x+pk*d,p)
        p3 = m2* numderivative(list(f, p), x)*d
        end
    else
        while (p1 <= p2 & p1 >= p3)
        pk= pk*2
        p1 = f(x+pk*d,p)
        p2= f(x,p) + m1* numderivative(list(f, p), x)*d*pk
        p3 = m2* numderivative(list(f, p), x)*d
        end
        pk = pk/2
    end
endfunction
