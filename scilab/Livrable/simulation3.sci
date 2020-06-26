path = get_absolute_file_path('simulation3.sci')
common_path = path+'common/'
exec(path+'function3.sci', -1)
exec(common_path+'algorithm.sci', -1)
exec(common_path+'linear_search.sci', -1)
exec(common_path+'utils.sci', -1)

x_init = [0; 0; 0;
         1; 0; 0;
         0; 1; 0;
         0; 0; 1]

x_init3 = [0; 0; 0;
          1; 0; 0;
          0; 1; 0;
          0; 0; 1;
          0; 0; -1]

//* ex1
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
//*/

//* ex3
global lambda 
H_3 = eye(15,15)
m_3 = [0.5; 0.9]
lambda = 10
[r3_10, i3_10, diff3_10] = BFGS(sum_v2, x_init3, H_3, m_3, 'armijo')
lambda = 100
[r3_100, i3_100, diff3_100] = BFGS(sum_v2, x_init3, H_3, m_3, 'armijo')
//*/

