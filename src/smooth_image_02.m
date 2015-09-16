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

% MOVE WORK OUT OF THE LOOP
% precompute constants
weight = 1/window_size^2;
delta_win = (window_size-1)/2;

% loop over all pixels
for ii = (1+nump):(numr+nump)
    fprintf('%i of %i\n', ii-nump, numr);
    for jj = (1+nump):(numc+nump)
   
        % loop over pixels in local window    
        val = 0;
        for pp = (ii-delta_win):(ii+delta_win)
            for qq = (jj-delta_win):(jj+delta_win)             
                val = val+image(pp,qq);
            end
        end
        
        % MOVE WORK OUT OF THE LOOP
        % apply common factors once
        smooth_image(ii-nump, jj-nump) = val*weight;
                
    end
end

% plot result
figure;
imagesc(smooth_image);
colormap(gray);
axis equal
