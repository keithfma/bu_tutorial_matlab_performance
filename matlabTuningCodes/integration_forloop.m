function integration_forloop
a = 0;               % lower limit of integration
b = pi/2;            % upper limit of integration
for n=1:4
    m = 10000*2^(n-1);
    tic
    for j=1:100
        h = (b - a)/m;       % increment length
        integral = midpoint_integration_forloop(@cos, a, h, m);
    end
    tn=toc/100;
    disp(['Walltime for m = ' num2str(m) ' is ' num2str(tn)])
end

function integral = midpoint_integration_forloop(fct, a, h, m)
% function integral = midpoint_integration_forloop(fct, a, h, m)
% performs midpoint integration with forloop
integral = 0;          % initialize integral
for i=1:m
    x = a+(i-0.5)*h;   % mid-point of increment i
    integral = integral + fct(x)*h;
end
