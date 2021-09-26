function [dydt] = eq1(t,y,mt,m)
    global F_mag
    global G
    global M
    global m_0
    global alpha
    global t_f
    


    F=[0 F_mag]
    dydt = zeros(1,4);
    dydt(3:4) = y(1:2)/mag(y(1:2))*(F/(m_0-alpha*t) - G*M/mag(y(1:2))^2);
    dydt(1:2) = y(3:4);
    dydt = transpose(dydt);
    
end


