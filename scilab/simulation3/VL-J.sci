/*
Fonction du potentiel de Lennard-Jones
*/
function [v] = VL-J(x1, x2)
    r = norm(x1 - x2)
    v = 4*(r^(-6)-0.5)^2-1 
endfunction
