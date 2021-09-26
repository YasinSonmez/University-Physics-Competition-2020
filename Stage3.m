%----------Code for Stage 3---------------------

t_stage1 = 59.09e6;
t_stage2 = 1.715e8;

global alpha
global m_0
global m_3
m_3 = m_0 - alpha*(t_stage1+t_stage2);

t_up = 1;
t_down =3.165e7;

global m_3down_i
m_3down_i = m_3 - alpha*t_up;

V_assisted = 22.02e3;

%Accelaration Forward:
a_i = [0,V_assisted];
[t,a] = ode45(@Stage_3Up, [0 t_up], a_i);

%Accelaration BAckward:
b_i = a(end,:);
[t,b] = ode45(@Stage_3Down, [0 t_down], b_i);

