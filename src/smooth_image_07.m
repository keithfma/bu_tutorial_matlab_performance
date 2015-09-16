% Script. Read image and smooth with a square sliding window of Gaussian
% weights.
%
% Version 07: Vectorize inner loop, step 2, row-at-once
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

% loop over all rows

smoothed = zeros(numr, numc);
numw = window_size^2;

[delta_col, delta_row] = meshgrid(-nump:nump, -nump:nump);
delta_row = repmat(delta_row(:), 1, numc);
delta_col = repmat(delta_col(:), 1, numc);
delta = delta_row+delta_col*(numr+2*nump);

for ii = (1+nump):(numr+nump)
    fprintf('column %i of %i\n', ii-nump, numr);
    
    jj = repmat((1+nump):(numc+nump), numw, 1);    
    kk = ii+(jj-1)*(numr+2*nump);
    smoothed(ii-nump, :) = sum(image(kk+delta));
    
end
smoothed = smoothed/numw;

% plot result
figure;
imagesc(smoothed);
colormap(gray);
axis equal
