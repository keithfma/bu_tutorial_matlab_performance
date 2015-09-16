function C = forloops(N1, N2)
tic
VL1=1; VL2=1; VH1=1; VH2=1;
s = 0;
for i = 1:N1-1
for j = 1:N1-i
for k = 1:N2
   s=s+1;
   a =(1+j*log(VL2/VL1))/(j + k);
   b = (2 - i*log(VH1/VH2))/(1+i);
   x = (1-(1+a)*exp(-a))/(1-(1+b)*exp(-b));
   if x > VH2/VL2
     C(s,1) = i;
     C(s,2) = j;
     C(s,3) = k;
   end
end
end
end
toc
end

