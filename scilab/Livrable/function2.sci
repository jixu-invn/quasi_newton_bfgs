/*
Fonction1 pour la simulation 2
*/
function r=f1(x)
    global t
    global y1
    global a
    r=0
    for i = 1:length(t)
       ft = x(1)*exp(-x(2)*t(i))* cos(x(3)*t(i) + x(4));
       delta = (ft-y1(i))^2
       r = r+ delta;
    end
    r= r + a*(x(1)^2+x(2)^2+x(3)^2+x(4)^2)
endfunction

/*
Fonction2 pour la simulation 2
*/
function r=f2(x)
    global t
    global y2
    global a
    r=0
    for i = 1:length(t)
       ft = x(1)*exp(-x(2)*t(i))* cos(x(3)*t(i) + x(4));
       delta = (ft-y2(i))^2
       r = r+ delta;
    end
    r= r + a*(x(1)^2+x(2)^2+x(3)^2+x(4)^2)
endfunction
