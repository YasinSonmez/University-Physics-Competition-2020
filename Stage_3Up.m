function [dadt] = Stage_3Up(t,a)
    global F_mag
    global m_3
    global alpha
    
    dadt = zeros(1,2);
    dadt(2) = F_mag/(m_3-alpha*t);
    dadt(1) = a(2);
    dadt = transpose(dadt);
end
