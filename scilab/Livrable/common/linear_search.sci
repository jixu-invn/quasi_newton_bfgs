/*
ARMIJO
*/
function [pk] = armijo(f,x,d,m)
    pk=1
    p1 = f(x+pk*d)
    p0 = f(x)+m* numderivative(f, x)*d*pk
    if (p1 <= p0) then
        while (p1 <= p0)
        pk= pk*2
        p1 = f(x+pk*d)
        p0 = f(x)+m* numderivative(f, x)*d*pk
        end
        pk = pk/2
    else
        while (p1 > p0)
        pk= pk/2
        p1 = f(x+pk*d)
        p0 = f(x)+m* numderivative(f, x)*d*pk
        end
    end
endfunction

/*
GOLDSEIN
*/
function [pk] = goldsein(f,x,d,m1,m2)
    pk=1
    p1 = f(x+pk*d)
    p2= f(x) + m2* numderivative(f, x)*d*pk
    p3 = f(x) + m1* numderivative(f, x)*d*pk
    if (p1>p3) then
        while (p1>p3)
        pk= pk/2
        p1 = f(x+pk*d)
        p3 = f(x) + m1* numderivative(f, x)*d*pk
        end
    elseif(p1<p2) then
        while (p1<p2)
        pk= pk*2
        p1 = f(x+pk*d)
        p2= f(x) + m2* numderivative(f, x)*d*pk
        end
    else
        while (p1 <= p3 & p1 >= p2)
        pk= pk*2
        p1 = f(x+pk*d)
        p2= f(x) + m2* numderivative(f, x)*d*pk
        p3 = f(x) + m1* numderivative(f, x)*d*pk
        end
        pk = pk/2
    end
endfunction

/*
WOLFE
*/
function [pk] = wolfe(f,x,d,m1,m2)
    pk=1
    p1 = f(x+pk*d)
    p2= f(x) + m1* numderivative(f, x)*d*pk
    p3 = m2* numderivative(f, x)*d
    if (p1>p2)  then
        while(p1>p2)
        pk= pk/2
        p1 = f(x+pk*d)
        p2= f(x) + m1* numderivative(f, x)*d*pk
        end
    elseif (p1 < p3)then
        while(p1 < p3)
        pk= pk*2
        p1 = f(x+pk*d)
        p3 = m2* numderivative(f, x)*d
        end
    else
        while (p1 <= p2 & p1 >= p3)
        pk= pk*2
        p1 = f(x+pk*d)
        p2= f(x) + m1* numderivative(f, x)*d*pk
        p3 = m2* numderivative(f, x)*d
        end
        pk = pk/2
    end
endfunction
