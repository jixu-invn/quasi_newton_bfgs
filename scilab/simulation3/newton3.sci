/*
Fonction de Newton
*/
function [rx,i,dif]= newton(f,x)  
    xk= x
    [gx,hx]=  numderivative(f, xk, [], [],"blockmat")
    xkk = xk - inv(hx)*gx'
    //disp(norm(xkk - xk))
    if norm(xkk - xk) < 10^(-9) then
        rx = xk
        i=1
        dif = list(norm(xkk - xk))
    else
        [rx,i,dif] = newton(f,xkk);
        i = i + 1
        dif($+1)= norm(xkk-xk)
    end
endfunction
