%--------function for finding a magnitude of a vector-------
function [magnitude] = mag(v)
    n = length(v);
    magnitudesq = 0;
    for i = 1 : 1 : n
        magnitudesq = magnitudesq + v(i)^2;
    end
    magnitude = sqrt(magnitudesq);
end

