function [dydt] = eq2prime(t,y)
    global F_mag
    global G
    global M
    global m_0
    global alpha
    

    c = y(1:2) / mag(y(1:2)) + y(3:4)/mag(y(3:4));
    

    dydt = zeros(1,4);
    dydt(3:4) = F_mag*c /((m_0-alpha*t)*mag(c)) -  G*M*y(1:2)/mag(y(1:2))^3;
    dydt(1:2) = y(3:4);
    dydt = transpose(dydt);
    
end