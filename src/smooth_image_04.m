% Script. Read image and smooth with a square sliding window of Gaussian
% weights.
%
% Version 04: Eliminate temporary variables inside loop
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

% loop over all pixels
for ii = (1+nump):(numr+nump)
    fprintf('column %i of %i\n', ii-nump, numr);
    for jj = (1+nump):(numc+nump)

        smoothed(ii-nump, jj-nump) = ...
            sum(sum(image((ii-nump):(ii+nump), (jj-nump):(jj+nump))));
                
    end
end
smoothed = smoothed/window_size^2;

% plot result
figure;
imagesc(smoothed);
colormap(gray);
axis equal
