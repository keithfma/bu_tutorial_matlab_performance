% Script. Prepare data used in the example(s) for this tutorial

% define parameters
fin = 'moon.jpg';
dout = '../data/';
fout = [dout, 'moon.png'];
fout_noisy = [dout, 'moon_noisy.png'];
dfact = 5; 
noise_ampl = 0.5;

% read and convert image to grayscale
im = imread(fin);
im = rgb2hsv(im);
im = im(:,:,3);

% downscale
im = im(1:dfact:end, 1:dfact:end);

% write clean image
mkdir(dout);
imwrite(im, fout, 'BitDepth', 16);

% add gaussian noise with amplitude 1, mean 0
noise = noise_ampl*(randn(size(im))-0.5);
im = im+noise;

% write noisy image
imwrite(im, fout_noisy, 'BitDepth', 16);


