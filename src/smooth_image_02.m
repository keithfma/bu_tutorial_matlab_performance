% Script. Read image and smooth with a square sliding window of Gaussian
% weights.
%
% Version 02: Move independent/redundant operations out of the inner loop
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
weight = 1/window_size^2;
for ii = (1+nump):(numr+nump)
    fprintf('column %i of %i\n', ii-nump, numr);
    for jj = (1+nump):(numc+nump)
   
        % loop over pixels in local window    
        val = 0;
        for pp = (ii-nump):(ii+nump)
            for qq = (jj-nump):(jj+nump)            
                val = val+image(pp,qq);
            end
        end
        
        smoothed(ii-nump, jj-nump) = val*weight;
                
    end
end

% plot result
figure;
imagesc(smoothed);
colormap(gray);
axis equal
