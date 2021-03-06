path = get_absolute_file_path('simulation3.sci')

exec(path+'ltv.sci', -1)
exec(path+'utils.sci', -1)
exec(path+'BFGS_3.sci', -1)

x_init = [0; 0; 0;
         1; 0; 0;
         0; 1; 0;
         0; 0; 1]

x_init3 = [0;0;0;
          1;0;0;
          0;1;0;
          0;0;1;
          0;0;-1]

/* ex1
H_1 = eye(12,12)
m_1 = [0.5; 0.9]
[r_a,i_a,diff_a] = BFGS(sum_v,x_init,H_1,m_1,'armijo')
[r_g,i_g,diff_g] = BFGS(sum_v,x_init,H_1,m_1,'goldsein')
[r_w,i_w,diff_w] = BFGS(sum_v,x_init,H_1,m_1,'wolfe')

diffa = ltv(i_a, diff_a)
diffg = ltv(i_g, diff_g)
diffw = ltv(i_w, diff_w)

subplot(2,2,1)
plot(1:i_a,diffa')
subplot(2,2,2)
plot(1:i_g,diffg')
subplot(2,2,3)
plot(1:i_w,diffw')
*/

global lambda 
lambda = 10
H_3 = eye(15,15)
m_3 = [0.5; 0.9]
[r3_a, i3_a, diff3_a] = BFGS(sum_v2, x_init3, H_3, m_3, 'armijo')
[r3_g, i3_g, diff3_g] = BFGS(sum_v2, x_init3, H_3, m_3, 'goldsein')
[r3_w, i3_w, diff3_w] = BFGS(sum_v2, x_init3, H_3, m_3, 'wolfe')

diff3a = ltv(i3_a, diff3_a)
diff3g = ltv(i3_g, diff3_g)
diff3w = ltv(i3_w, diff3_w)

subplot(2,2,1)
plot(1:i3_a,diff3a')
subplot(2,2,2)
plot(1:i3_g,diff3g')
subplot(2,2,3)
plot(1:i3_w,diff3w')
