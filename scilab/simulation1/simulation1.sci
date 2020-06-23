path = get_absolute_file_path('simulation1.sci')

exec(path+'armijo.sci', -1)
exec(path+'newton.sci', -1)
exec(path+'function_r.sci', -1)
exec(path+'BFGS.sci', -1)

x_init = [-1;1]
p1 = 10
p2 = 100
x_sol = [1;1]

r1 = f1(x_sol,p1)
r2 = f1(x_sol,p2)
mprintf('le résultat de la fonction de la 1ere simulation p=10: %i\n',r1)
mprintf('le résultat de la fonction de la 1ere simulation p=100: %i\n',r2)

r1 = newton(f1,p1,x_init) 
r2 = newton(f1,p2,x_init) 
mprintf('la méthode newton de la 1ere simulation p=10:\n')
disp(r1)
mprintf('la méthode newton de la 1ere simulation p=100:\n')
disp(r2)

H = eye(2,2)
m = 0.5
[r1,i1] = BFGS(f1,p1,x_init,H,m)
[r2,i2] = BFGS(f1,p2,x_init,H,m)
mprintf('la méthode BFGS de la 1ere simulation p=10: %e\n',r1)
disp(r1)
disp(i1)

mprintf('la méthode BFGS de la 1ere simulation p=100: %e\n',r2)
disp(r2)
disp(i2)

