%%--------------------Code for Stage1---------------------------

%defining constants:
d_0 = 6650000;
global t_f1
t_f1 = 50000000;
global t_f2
t_f2 = 20000000;
t_interval = 1;
global F_mag
F_mag = 400e-3;
global m_0
m_0 = 5000;
global G 
G = 6.67e-11;
global M 
M= 5.97e24;
global alpha
alpha = 5e-6;
R_moon = 3.8e8; 
global beta_1
beta_1 = pi/2;
global beta_2
beta_2 = pi/4;

%defining initial conditions
r_0 = [0 d_0];
r_0dot = [sqrt(G*M/d_0) 0];
y_0 = [r_0 r_0dot];
F_0 = [0 F_mag];

[t,y] = ode23t(@eq2, [0:1000:t_f1], y_0);
[t z] = ode23t(@eq2prime,[t_f1:1000:t_f2+t_f1],y(end,:));

dtot = [y;z];

th = 0:pi/100:2*pi;
x_moon = R_moon * cos(th) ;
y_moon = R_moon * sin(th) ;
plot(-y(:,1),y(:,2))
hold on
plot(x_moon, y_moon)
legend('Trajectory of SpaceCraft','Trajectory of Moon')
xlabel('x(m)')
ylabel('y(m)')
title('Escaping From Earth')

% finding the intersection time with moon
t_stage1=0;
for i = 1: 1 :length(y(:,1))
   if(  (332997000-0.5e6)<y(i,1) &&  y(i,1)<(332997000+0.5e6) && (183066000-0.5e6)<y(i,2) && y(i,2)<(183066000+0.5e6) )
       t_stage1 = i*1000;
       break;
   end
end
index = i;



