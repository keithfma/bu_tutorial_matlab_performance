tic
for j=1:10
i = 0;
for t = 0:.01:100
    i = i + 1;
    y(i) = sin(t);
end
end
toc
