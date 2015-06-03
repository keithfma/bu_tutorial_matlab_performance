n = 5000; x = zeros(n,1);
tic
for i=1:n
  x(i) = i^2;
end
toc
