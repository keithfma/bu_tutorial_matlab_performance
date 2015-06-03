function C = vectorform(N1, N2)
tic
VL1=1; VL2=1; VH1=1; VH2=1;
s=0;
C = zeros((N1-1)*N1*N2/2,3);
for i = 1:N1-1
   m1 = N1 - i; m2 = N2; m12 = m1*m2;
   J = repmat(1:m1,m2,1); 
   K = repmat((1:m2)',1,m1);
   a=(1+J(:)*log(VL2/VL1))./(J(:) + K(:));
   b = (2 - i*log(VH1/VH2))/(1+i);
   x = (1-(1+a).*exp(-a))/(1-(1+b)*exp(-b));       
   L = x > VH2/VL2;
   C(s+(1:m12),:) = [i*L  J(:).*L  K(:).*L];
   s = s + m12;
end
toc  
end

