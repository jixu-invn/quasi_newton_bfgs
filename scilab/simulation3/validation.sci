
function [result] = f(x)
    result = x(1)^2 - 4*x(1)
endfunction

path = get_absolute_file_path('validation.sci')

exec(path+'ltv.sci', -1)
exec(path+'BFGS_3.sci', -1)
exec(path+'newton3.sci', -1)

x0 = [0]

[r1,i1,dif1] = newton(f,x0) 
difa1 = ltv(i1,dif1)
subplot(2,2,1)
plot(1:i1,difa1')

mprintf('la méthode newton de la validation:\n')
disp(r1)
mprintf('itération de méthode newton de la validation: \n')
disp(i1)

H = eye(1,1)
m = [0.5, 0.9]
[r3,i3,dif3] = BFGS(f,x0,H,m(1),'armijo')
[r5,i5,dif5] = BFGS(f,x0,H,m,'goldsein')
[r6,i6,dif6] = BFGS(f,x0,H,m,'wolfe')

difa3 = ltv(i3,dif3)
difa5 = ltv(i5,dif5)
difa6 = ltv(i6,dif6)

subplot(2,2,2)
plot(1:i3,difa3')
subplot(2,2,3)
plot(1:i5,difa5')
subplot(2,2,4)
plot(1:i6,difa6')

mprintf('la méthode BFGS de la validation: \n')
disp(r3)
mprintf('itération de méthode BFGS de la validation: \n')
disp(i3)

mprintf('la méthode BFGS de la validation: \n')
disp(r5)
mprintf('itération de méthode BFGS de la validation: \n')
disp(i5)

mprintf('la méthode BFGS de la validation: \n')
disp(r6)
mprintf('itération de méthode BFGS de la validation: \n')
disp(i6)
