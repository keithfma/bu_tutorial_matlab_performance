n=5000; x = zeros(n);

tic
for j=1:n   % rows
   for i=1:n    % columns
     x(i,j) = i+(j-1)*n;
   end
end
tji = toc;
disp(['Preferred for-loop order walltime is ' num2str(tji)])
