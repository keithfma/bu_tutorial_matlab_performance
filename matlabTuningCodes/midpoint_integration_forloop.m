function integral = midpoint_integration_forloop(fct, a, h, m)
% function integral = midpoint_integration_forloop(fct, a, h, m)
% performs midpoint integration with forloop
integral = 0;          % initialize integral
for i=1:m
   x = a+(i-0.5)*h;   % mid-point of increment i
   integral = integral + fct(x)*h;
end
end
