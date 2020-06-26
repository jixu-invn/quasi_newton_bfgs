path = get_absolute_file_path('simulation2.sci')
common_path = path+'common/'
exec(path+'function2.sci', -1)
exec(common_path+'algorithm.sci', -1)
exec(common_path+'linear_search.sci', -1)
exec(common_path+'utils.sci', -1)

global t
global y1
global y2
global a
[t,y1,y2]=generator()
x=[1.2;0.9;4/3*%pi+0.1;0.2]
a=0
[rx1,i1,dif1] = newton(f1,x)
[rx1_1,i1_1,dif1_1] = BFGS(f1,[1;1;1;1],eye(4,4),0.9,'armijo')
// Le méthode de Newton est limité par l'intiale donc on utilise bfgs 
[rx2_1,i2_1,dif2_1] = BFGS(f2,[1;1;1;1],eye(4,4),0.9,'armijo')
a=0.1
[rx3_1,i3_1,dif3_1] = BFGS(f2,[1;1;1;1],eye(4,4),0.9,'armijo')
a=0.01
[rx3_2,i3_2,dif3_2] = BFGS(f2,[1;1;1;1],eye(4,4),0.9,'armijo')
a=0.001
[rx3_3,i3_3,dif3_3] = BFGS(f2,[1;1;1;1],eye(4,4),0.9,'armijo')
a=0.0001
[rx3_4,i3_4,dif3_4] = BFGS(f2,[1;1;1;1],eye(4,4),0.9,'armijo')
difa3_1 = ltv(i3_1,dif3_1)
difa3_2 = ltv(i3_2,dif3_2)
difa3_3 = ltv(i3_3,dif3_3)
difa3_4 = ltv(i3_4,dif3_4)
subplot(2,2,1)
plot(1:i3_1,difa3_1')
subplot(2,2,2)
plot(1:i3_2,difa3_2')
subplot(2,2,3)
plot(1:i3_3,difa3_3')
subplot(2,2,4)
plot(1:i3_4,difa3_4')


