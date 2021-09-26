%---------Code for Stage2---------------------
R_E = 1.496e11; % in meters
R_sat = 6.55e11; % in meters
phi = -pi*0.47;
T_sat = 11.86*365*24*60*60; %in sec
t_f2 = 1.715e8;

global M_sun
M_sun = 1.989E30;  % in kg
global G
global m_0
global alpha
global theta
theta = 0;

%time passed at the first stage:
t_1 = 59.09e6; %in sec.

%mass at the beginning of stage 2:
global m_1
m_1 = m_0 - alpha*t_1;

%initial velocities:
V_esc = 30.480e3;
V_sat = sqrt(G*M_sun/R_sat);

%initial conditions:
r_i =[-R_E,0];
r_sat_i = [-R_sat*cos(phi),R_sat*sin(phi)];
r_0dot_i = [0 V_esc];
r_satdot_i = [-V_sat*sin(phi),-V_sat*cos(phi)];

%initial vectors:
q_1i = r_i;
q_2i = r_0dot_i;
q_sat1i = r_sat_i;
q_sat2i = r_satdot_i;

q_i = [q_1i,q_2i];
q_sat_i = [q_sat1i,q_sat2i];

%Solving ODE'S:
[t,q_sat] = ode23t(@Stage2_ODESat, [0:1e5:t_f2], q_sat_i);
[t,q] = ode23t(@Stage2_ODE, [0:1e5:t_f2], q_i);


plot(q_sat(:,1),q_sat(:,2))
hold on
plot(-q(:,1),q(:,2))
legend('Trajectory of Jupiter','Trajectory of SpaceCraft')
xlabel('x(m)-From Sun')
ylabel('y(m)-From Sun')
title('Travel to Jupiter After Escaping From Earth')



