n=5000; x = zeros(n);

tic
for i=1:n   % rows
   for j=1:n    % columns
     x(i,j) = i+(j-1)*n;
   end
end
tij = toc;
disp(['for-loop order walltime is ' num2str(tij)])
