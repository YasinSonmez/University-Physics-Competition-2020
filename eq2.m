function [dydt] = eq2(t,y)
    global F_mag
    global G
    global M
    global m_0
    global alpha
    global beta_1
    
    dydt = zeros(1,4);
    dydt(3:4) = F_mag*cos(beta_1)*y(3:4)/((m_0-alpha*t)*mag(y(3:4))) + F_mag*sin(beta_1)*y(1:2)/((m_0-alpha*t)*mag(y(1:2))) -  G*M*y(1:2)/mag(y(1:2))^3;
    dydt(1:2) = y(3:4);
    dydt = transpose(dydt);
    
end