/*
Fonction du potentiel de Lennard-Jones
*/
function [v] = VL_J(x1, x2)
    r = norm(x1 - x2)
    v = 4*(r^(-6)-0.5)^2-1 
endfunction

/*
Fonction de la somme de potentiel
*/
function [result] = sum_v(x)
    result = 0
    n = size(x)(1)
    for i = 1:n-1
        for j = i+1:n
            result = result + VL_J(x(i, :), x(j, :))
        end
    end
endfunction
