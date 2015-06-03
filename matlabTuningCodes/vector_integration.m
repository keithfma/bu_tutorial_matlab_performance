% integration with vector form
a = 0;      % lower limit of integration
b = pi/2;   % upper limit of integration
for n=1:6
   m = 10000*2^(n-1);
   tic
   for i=1:100
   h = (b - a)/m;      % increment length
   x = a+h/2:h:b-h/2;  % mid-points of m increments
   integral = sum(cos(x)*h);
   end
   tn=toc/100;
   disp(['Walltime for m = ' num2str(m) ' is ' num2str(tn)])
end

