% integration with for-loop
a = 0;               % lower limit of integration
b = pi/2;            % upper limit of integration
for n=1:6
   m = 10000*2^(n-1);
   tic
   for j=1:100
   h = (b - a)/m;       % increment length
   integral = 0;        % initialize integral
   for i=1:m
     x = a+(i-0.5)*h;   % mid-point of increment i
     integral = integral + cos(x)*h;
   end
   end
   tn=toc/100;
   disp(['Walltime for m = ' num2str(m) ' is ' num2str(tn)])
end

