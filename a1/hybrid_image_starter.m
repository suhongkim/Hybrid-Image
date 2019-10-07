close all; clear; 

% read images. Replace with your own images for the submission.
im1 = imread('./DerekPicture.jpg');
im2 = imread('./nutmeg.jpg');
im1 = rgb2gray(im1); % convert to grayscale
im2 = rgb2gray(im2);

% use this if you want to align the two images (e.g., by the eyes) and crop
% them to be of same size
% [im2, im1] = align_images(im2, im1);
% imwrite(im2, 'image2.png'); 
% imwrite(im1, 'image1.png'); 
im1 = imread('image1.png'); 
im2 = imread('image2.png'); 
% uncomment this when debugging hybridImage so that you don't have to keep aligning
% keyboard; 
% or save the aligned versions of the image and read them directly while debugging.

%% Choose the cutoff frequencies and compute the hybrid image (you supply
%% this code)
arbitrary_value = 100;
cutoff_low = arbitrary_value;
cutoff_high = arbitrary_value; 
im12 = hybridImage(im1, im2, cutoff_low, cutoff_high);

%% Crop resulting image (optional)
figure(1), hold off, imagesc(im12), axis image, colormap gray
disp('input crop points');
[x, y] = ginput(2);  x = round(x); y = round(y);
im12 = im12(min(y):max(y), min(x):max(x), :);
figure(1), hold off, imagesc(im12), axis image, colormap gray

%% resize 
im12_small = subsampleImage(uint8(255*im12), 8, 0.5); 
figure, montage({im12, im12_small}); 
% subplot(1,2,1), imshow(im12_small);
% subplot(1,2,2), imshow(im12); 