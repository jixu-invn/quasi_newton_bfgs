path = get_absolute_file_path('simulation3.sci')

exec(path+'utils.sci', -1)
exec(path+'BFGS_3.sci', -1)

x_init = [0; 0; 0;
         1; 0; 0;
         0; 1; 0;
         0; 0; 1]

H = eye(12,12)
m = [0.5; 0.9]
[r_a,i_a,dif_a] = BFGS(sum_v,x_init,H,m,'armijo')
[r_g,i_g,dif_g] = BFGS(sum_v,x_init,H,m,'goldsein')
[r_w,i_w,dif_w] = BFGS(sum_v,x_init,H,m,'wolfe')

difa = ltv(i_a, dif_a)
difg = ltv(i_g, dif_g)
difw = ltv(i_w, dif_w)

subplot(2,2,1)
plot(1:i_a,difa')
subplot(2,2,2)
plot(1:i_g,difg')
subplot(2,2,3)
plot(1:i_w,difw')
