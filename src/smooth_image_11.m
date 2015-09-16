function [] = smooth_image_11()
% Read image and smooth with a square moving average convolution.
%
% Version 11: Use compiled code for critical section, in this case built-in
%
% Keith Ma, 9/15/2015

% define parameters
image_name = '../data/moon_noisy.png';
window_size = 9; % pixels, odd

% read in data
image = imread(image_name);
image = double(image)+1;
[numr, numc] = size(image);

window = ones(window_size)/window_size^2;
smoothed = conv2(image, window);

% plot result
figure;
imagesc(smoothed);
colormap(gray);
axis equal
