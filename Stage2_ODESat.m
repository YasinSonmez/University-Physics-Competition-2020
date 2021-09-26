function [dq_satdt] = Stage2_ODESat(t,q_sat)
    global G
    global M_sun

    dq_satdt = zeros(1,4);
    dq_satdt(3:4) = -( G*M_sun/mag(q_sat(1:2))^3 )*q_sat(1:2);
    dq_satdt(1:2) = q_sat(3:4);
    dq_satdt = transpose(dq_satdt);
 end

