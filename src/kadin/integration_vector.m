function integration_vector
% integration with for-loop
a = 0;               % lower limit of integration
b = pi/2;            % upper limit of integration
for n=1:4
   m = 10000*2^(n-1);
   tic
   for j=1:100
   h = (b - a)/m;       % increment length
   integral = midpoint_integration_vector(@cos, a, h, m);
   end
   tn=toc/100;
   disp(['Walltime for m = ' num2str(m) ' is ' num2str(tn)])
end

function integral = midpoint_integration_vector(fct, a, h, m)
% function integral = midpoint_integration_vector(fct, a, h, m)
% midpoint integration with vector method
x = a+(h/2:h:m*h);  % mid-points of m increments
integral = sum(fct(x)*h);