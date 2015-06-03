n = 5000; x = (1:n);
x = x.^2;
tic
x = sqrt(x);
t1 = toc;
disp(['sqrt walltime is ' num2str(t1)])

x = x.^2;
tic
x = realsqrt(x);
t2 = toc
disp(['realsqrt walltime is ' num2str(t2)])
