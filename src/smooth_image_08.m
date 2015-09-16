% Script. Read image and smooth with a square sliding window of Gaussian
% weights.
%
% Version 08: Vectorize last remaining loop
%
% Keith Ma, 9/15/2015

clear all

% define parameters
image_name = '../data/moon_noisy.png';
window_size = 9; % pixels, odd

% read in data
image = imread(image_name);
image = double(image)+1;
[numr, numc] = size(image);

% pad image (use loops)
nump = (window_size-1)/2;
for ii = 1:nump
    image = [zeros(numr, 1), image, zeros(numr, 1)];
end

for ii = 1:nump
    image = [zeros(1, numc+2*nump); image; zeros(1, numc+2*nump)];
end

numw = window_size^2;
[delta_col, delta_row] = meshgrid(-nump:nump, -nump:nump);
delta_row = repmat(delta_row(:), 1, numr*numc);
delta_col = repmat(delta_col(:), 1, numr*numc);
delta = delta_row+delta_col*(numr+2*nump);

[jj, ii] = meshgrid((1+nump):(numc+nump), (1+nump):(numr+nump)); 
ii = repmat(ii(:)', numw, 1);
jj = repmat(jj(:)', numw, 1);
kk = ii+(jj-1)*(numr+2*nump);

win = image(kk+delta);
smoothed = sum(win)/numw;
smoothed = reshape(smoothed, numr, numc);

% plot result
figure;
imagesc(smoothed);
colormap(gray);
axis equal
