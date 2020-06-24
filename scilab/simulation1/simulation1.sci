path = get_absolute_file_path('simulation1.sci')

exec(path+'armijo.sci', -1)
exec(path+'newton.sci', -1)
exec(path+'function_r.sci', -1)
exec(path+'BFGS.sci', -1)
exec(path+'ltv.sci', -1)

x_init = [-1;1]
p1 = 10
p2 = 100
x_sol = [1;1]

r1 = f1(x_sol,p1)
r2 = f1(x_sol,p2)
mprintf('le résultat de la fonction de la 1ere simulation p=10: %i\n',r1)
mprintf('le résultat de la fonction de la 1ere simulation p=100: %i\n',r2)

[r1,i1,dif1] = newton(f1,p1,x_init) 
[r2,i2,dif2] = newton(f1,p2,x_init) 
difa1 = ltv(i1,dif1)
difa2 = ltv(i2,dif2)
subplot(2,2,1)
plot(1:i1,difa1)
subplot(2,2,2)
plot(1:i2,difa2)

mprintf('la méthode newton de la 1ere simulation p=10:\n')
disp(r1)
mprintf('itération de méthode newton de la 1ere simulation p=10: \n')
disp(i1)
mprintf('la méthode newton de la 1ere simulation p=100:\n')
disp(r2)
mprintf('itération de méthode newton de la 1ere simulation p=10: \n')
disp(i2)

H = eye(2,2)
m = 0.5
[r3,i3,dif3] = BFGS(f1,p1,x_init,H,m)
[r4,i4,dif4] = BFGS(f1,p2,x_init,H,m)
difa3 = ltv(i3,dif3)
difa4 = ltv(i4,dif4)
subplot(2,2,3)
plot(1:i3,difa3)
subplot(2,2,4)
plot(1:i4,difa4)
mprintf('la méthode BFGS de la 1ere simulation p=10: \n')
disp(r3)
mprintf('itération de méthode BFGS de la 1ere simulation p=10: \n')
disp(i3)

mprintf('la méthode BFGS de la 1ere simulation p=100: \n')
disp(r4)
mprintf('itération de méthode BFGS de la 1ere simulation p=100: \n')
disp(i4)

