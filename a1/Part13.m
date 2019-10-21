close all; clear; 
addpath('./images'); 

% test input
image = im2double(imread('images/lacoonf.png')); 
% image = imnoise(image, 'gaussian', 0, 0.01);

%% with Smoothing 
sigma = 0.9; 
LoGI =  enhanceImageLoG(image, sigma); 
LoG = LoGfilt(image,sigma);
LoG_norm = (LoG - min(LoG(:))) / (max(LoG(:)-min(LoG(:)))); 

figure,
subplot(2,3,1), imshow(image); title('Original'); 
subplot(2,3,2), imshow(LoGI); title('Enhanced with LoG, sigma=0.9'); 
subplot(2,3,3), imshow(LoG_norm); title('Filtered by LoG, sigma=0.9'); 

%% without smoothing
lapI = enhanceImageLoG(image, 0); 
lap = LoGfilt(image,sigma);
Lap_norm = (lap - min(lap(:))) / (max(lap(:)-min(lap(:)))); 

subplot(2,3,4), imshow(image); title('Original'); 
subplot(2,3,5), imshow(lapI); title('Enhanced with Laplacian, sigma=0'); 
subplot(2,3,6), imshow(Lap_norm); title('Filtered by Lapacian, sigma=0'); 

