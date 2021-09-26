function [dqdt] = Stage2_ODE(t,q)
    global F_mag
    global G
    global M_sun
    global m_1
    global alpha
    global theta
    
    R_theta = [cos(theta),-sin(theta);sin(theta),cos(theta)];
    dqdt = zeros(1,4);
    dqdt(3:4) = -(G*M_sun/mag(q(1:2))^3)*q(1:2)+( F_mag/( mag(q(3:4))*(m_1-alpha*t) ) )* transpose(transpose(q(3:4))* R_theta);
    dqdt(1:2) = q(3:4);
    dqdt = transpose(dqdt);
    

end

