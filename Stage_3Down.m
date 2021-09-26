function [dbdt] = Stage_3Down(t,b)
    global F_mag
    global m_3down_i
    global alpha
    
    dbdt = zeros(1,2);
    dbdt(2) = -(F_mag/(m_3down_i-alpha*t));
    dbdt(1) = b(2);
    dbdt = transpose(dbdt);
end

