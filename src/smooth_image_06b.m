function [] = smooth_image_06()
% Script. Read image and smooth with a square sliding window of Gaussian
% weights.
%
% Version 01: Slow, but correct.
%
% Keith Ma, 9/15/2015

% define parameters
image_name = '../data/moon_noisy.png';
window_size = 9; % pixels, odd

% read in data
image = imread(image_name);
image = double(image)+1;
[numr, numc] = size(image);

weight = ones(window_size)/window_size^2;
smooth_image = conv2(image, weight);

% plot result
figure;
imagesc(smooth_image);
colormap(gray);
axis equal
