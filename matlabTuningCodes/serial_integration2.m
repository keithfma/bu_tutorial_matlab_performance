function serial_integration2
% integration with for-loop
a = 0;               % lower limit of integration
b = pi/2;            % upper limit of integration
for n=1:3
   m = 10000*2^(n-1);
   tic
   for j=1:100
   h = (b - a)/m;       % increment length
   integral = midpoint_integration(@cos, a, h, m);
   end
   tn=toc/100;
   disp(['Walltime for m = ' num2str(m) ' is ' num2str(tn)])
end

function integral = midpoint_integration(fct, a, h, m)
integral = 0;          % initialize integral
for i=1:m
   x = a+(i-0.5)*h;   % mid-point of increment i
   integral = integral + fct(x)*h;
end