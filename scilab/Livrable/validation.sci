function [result] = f(x)
    result = 3*x(1)^2 - 11*x(1)
endfunction

path = get_absolute_file_path('validation.sci')
common_path = path+'common/'
exec(common_path+'algorithm.sci', -1)
exec(common_path+'linear_search.sci', -1)
exec(common_path+'utils.sci', -1)

x0 = [0]

[r1,i1,dif1] = newton(f,x0) 
difa1 = ltv(i1,dif1)
subplot(2,2,1)
plot(1:i1,difa1')
xtitle('Méthode de Newton', 'Iterations', 'diff')

mprintf('la méthode newton de la validation:\n')
disp(r1)
mprintf('itération de méthode newton de la validation: \n')
disp(i1)

H = eye(1,1)
m = [0.5, 0.9]
[r1,i1,diff1] = BFGS(f,x0,H,m(1),'armijo')
[r2,i2,diff2] = BFGS(f,x0,H,m,'goldsein')
[r3,i3,diff3] = BFGS(f,x0,H,m,'wolfe')

difa1 = ltv(i1,diff1)
difa2 = ltv(i2,diff2)
difa3 = ltv(i3,diff3)

subplot(2,2,2)
plot(1:i1,difa1')
xtitle('BFGS armijo', 'Iterations', 'diff')
subplot(2,2,3)
plot(1:i2,difa2')
xtitle('BFGS glodsein', 'Iterations', 'diff')
subplot(2,2,4)
plot(1:i3,difa3')
xtitle('BFGS ', 'Iterations', 'diff')

mprintf('la méthode BFGS de la validation: \n')
disp(r1)
mprintf('itération de méthode BFGS de la validation: \n')
disp(i1)

mprintf('la méthode BFGS de la validation: \n')
disp(r2)
mprintf('itération de méthode BFGS de la validation: \n')
disp(i2)

mprintf('la méthode BFGS de la validation: \n')
disp(r3)
mprintf('itération de méthode BFGS de la validation: \n')
disp(i3)
