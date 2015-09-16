function y = lazyCopy(A, x, b, change)
% function y = lazyCopy(A, x, b, change)
% Purpose: To demonstrate MATLAB "laza copy" behavior
%          You can monitor memory usage with Windows task manager
% Usage:
% n=5000; A=rand(n); x=rand(n,1); b=rand(n,1);
% y=lazyCopy(A, x, b, 0);   % A is not copied
% y=lazyCopy(A, x, b, 1);   % A changed, A is copied

if change
   A(2,3) = 23; 
end
y = A*x + b;
pause(5)  % allow extra time to visualize memory usage change
