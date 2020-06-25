/*
Fonction du potentiel de Lennard-Jones
*/
function [v] = VL_J(x1, x2)
    r = norm(x1 - x2)
    v = 4*(r^(-6)-0.5)^2-1 
endfunction

/*
Fonction de la somme de potentiel
x is a vector of R^3n
*/
function [result] = sum_v(x)
    result = 0
    n = size(x)(1)/3
    
    for i = 1:n-1
        for j = i+1:n
            result = result + VL_J(x(3*i-2:3*i), x(3*j-2:3*j))
        end
    end
endfunction
