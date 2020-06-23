function [t,y,y1]=fun2()
    t = zeros(100,1)
    y = zeros(100,1)
    y1 = zeros(100,1)
    for i= 1:100
        t(i,1)=  (4*i)*10^(-2)
        y(i,1) = 1*exp(-0.7*t(i,1))*cos(4*%pi/3*t(i,1)+0)
        y1(i,1) = 1*exp(-0.7*t(i,1))*cos(4*%pi/3*t(i,1)+0)+grand(1, 1, "nor", 0, 0.05)
    end
    plot(t,y)
    scatter(t,y1)
endfunction
