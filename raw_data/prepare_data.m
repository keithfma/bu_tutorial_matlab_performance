% Script. Prepare data used in the example(s) for this tutorial

% define parameters
fin = 'raw_data/moon.jpg';
fout = 'data/moon.png';
fout_noisy = 'data/moon_noisy.png';

% convert image to grayscale
im = imread(fin);
im = rgb2hsv(im);
im = im(:,:,3);
imwrite(im, fout, 'BitDepth', 16);

% add gaussian noise with amplitude 1, mean 0
noise = randn(size(im))-0.5;
imwrite(im+noise, fout_noisy, 'BitDepth', 16);


