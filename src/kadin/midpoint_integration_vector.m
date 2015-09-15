function integral = midpoint_integration_vector(fct, a, h, m)
% function integral = midpoint_integration_vector(fct, a, h, m)
% midpoint integration with vector method
   x = a+(h/2:h:m*h);  % mid-points of m increments
   integral = sum(fct(x)*h);
end
