function [] = smooth_image_10()
% Read image and smooth with a square moving average convolution.
%
% Version 10: Convert to a function
%
% Keith Ma, 9/15/2015

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
delta_row = delta_row(:);
delta_col = delta_col(:);
delta = delta_row+delta_col*(numr+2*nump);

[jj, ii] = meshgrid((1+nump):(numc+nump), (1+nump):(numr+nump)); 
ii = ii(:)';
jj = jj(:)';
kk = ii+(jj-1)*(numr+2*nump);

win = bsxfun(@plus, kk, delta);
smoothed = sum(image(win))/numw;
smoothed = reshape(smoothed, numr, numc);

% plot result
figure;
imagesc(smoothed);
colormap(gray);
axis equal
