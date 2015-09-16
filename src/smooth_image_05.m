% Script. Read image and smooth with a square sliding window of Gaussian
% weights.
%
% Version 01: Slow, but correct.
%
% Keith Ma, 9/15/2015

clear all

% define parameters
image_name = '../data/moon_noisy.png';
window_size = 9; % pixels, odd
window_sigma = 3; % pixels

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


% PREALLOCATE VARIABLES
% precompute and preallocate
delta_win = (window_size-1)/2;
smooth_array = zeros(numr, numc);

% loop over all pixels
for ii = (1+nump):(numr+nump)
    for jj = (1+nump):(numc+nump)
   
        smooth_image(ii-nump, jj-nump) = ...
            sum(sum(image( (ii-delta_win):(ii+delta_win), (jj-delta_win):(jj+delta_win) )));            

    end
end

% NORMALIZE ONCE
smooth_image = smooth_image/window_size^2;

% plot result
figure;
imagesc(smooth_image);
colormap(gray);
axis equal
