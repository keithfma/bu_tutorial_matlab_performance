function twosums(N, M)  
% function twosums(N, M)
% Purpose: compares performance of row- and column-sums of NxM matrix
% N -- number of rows
% M -- numbe rof columns

      if isdeployed           % if the program is twosums.exe, convert strings to numbers
         N = str2double(N);
         M = str2double(M);
      end
      
      A = rand(N,M);          % generate NxM random matrix
      tic
      a = row_sum(A);        % compute sum over rows
      trs = toc;
      B = A';
      tic
      b = column_sum(B);  % compute sum over columns
      tcs = toc;
      c = zeros(size(A,1),1);
      c(abs(a-b')> 0.001) = 1;      % identify any discrepancies between the 2 solutions
           
      disp(['** Column sum is ' num2str(floor((trs-tcs)*100/trs)) '% better than row sum'])
      disp(['** Walltime for row sums (dim=2) is ' num2str(trs)])
      disp(['** Walltime for column sums (dim=1) is ' num2str(tcs)])

      if any(c)
          disp(['** Number of difference is ' num2str(sum(c))])
      else
          disp('** Summation of both ways yield the same answer')
      end
end
           
function a = row_sum(A)
     for i=1:1000
          a=sum(A,2);
     end
end
           
function a = column_sum(A)
     for i=1:1000
          a = sum(A,1);
     end
end

