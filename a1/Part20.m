close all; clear; 

% read the aligned images
im1 = imread('image1.png'); 
im2 = imread('image2.png'); 

% generate the hybrid images
cutoff_low = 0.02;
cutoff_high = 0.04; 
im12 = hybridImage(im1, im2, cutoff_low, cutoff_high);

% crop the image 
x = [110;557]; 
y = [5;342]; 
im12 = im12(min(y):max(y), min(x):max(x), :);

% resize 
im12_small = subsampleImage(im12, 8, 3); 
figure, %montage({im12, im12_small}); 
subplot(1,2,1), imshow(im12); title('Hybrid Image (Lion Fish)'); 
subplot(1,2,2), imshow(im12_small); title('Resized Image (Nemo)'); 