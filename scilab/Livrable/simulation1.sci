path = get_absolute_file_path('simulation1.sci')
common_path = path+'common/'
exec(path+'function1.sci', -1)
exec(common_path+'algorithm.sci', -1)
exec(common_path+'linear_search.sci', -1)
exec(common_path+'utils.sci', -1)

x_init = [-1;1]
global p

p=10
[r1,i1,dif1] = newton(f1,x_init)
p=100 
[r2,i2,dif2] = newton(f1,x_init) 
difa1 = ltv(i1,dif1)
difa2 = ltv(i2,dif2)
subplot(3,2,1)
plot(1:i1,difa1')
subplot(3,2,2)
plot(1:i2,difa2')

mprintf('la méthode newton de la 1ere simulation p=10:\n')
disp(r1)
mprintf('itération de méthode newton de la 1ere simulation p=10: \n')
disp(i1)
mprintf('la méthode newton de la 1ere simulation p=100:\n')
disp(r2)
mprintf('itération de méthode newton de la 1ere simulation p=10: \n')
disp(i2)

H = eye(2,2)
m1 = 0.5
m2 = 0.9
p=10
[r3,i3,dif3] = BFGS(f1,x_init,H,[m1],'armijo')
p=100
[r4,i4,dif4] = BFGS(f1,x_init,H,[m1],'armijo')
[r5,i5,dif5] = BFGS(f1,x_init,H,[m1;m2],'goldsein')
[r6,i6,dif6] = BFGS(f1,x_init,H,[m1;m2],'wolfe')

difa3 = ltv(i3,dif3)
difa4 = ltv(i4,dif4)
difa5 = ltv(i5,dif5)
difa6 = ltv(i6,dif6)

subplot(3,2,3)
plot(1:i3,difa3')
subplot(3,2,4)
plot(1:i4,difa4')
subplot(3,2,5)
plot(1:i5,difa5')
subplot(3,2,6)
plot(1:i6,difa6')

mprintf('la méthode BFGS de la 1ere simulation p=10: \n')
disp(r3)
mprintf('itération de méthode BFGS de la 1ere simulation p=10: \n')
disp(i3)

mprintf('la méthode BFGS de la 1ere simulation p=100 de armijo: \n')
disp(r4)
mprintf('itération de méthode BFGS de la 1ere simulation p=100 de armijo: \n')
disp(i4)

mprintf('la méthode BFGS de la 1ere simulation p=100 de goldsein: \n')
disp(r5)
mprintf('itération de méthode BFGS de la 1ere simulation p=100 de goldsein: \n')
disp(i5)

mprintf('la méthode BFGS de la 1ere simulation p=100 de wolfe: \n')
disp(r6)
mprintf('itération de méthode BFGS de la 1ere simulation p=100 de wolfe: \n')
disp(i6)

