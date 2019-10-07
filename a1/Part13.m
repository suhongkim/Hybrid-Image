close all; clear; 

% test input
image = im2double(imread("images/lacoon.png")); 
% image = imnoise(image, 'gaussian', 0, 0.05);
% image = imfilter(image, fspecial('gaussian', 5,50)); 

sigma = 10; 
laplacianI = enhanceImageLoG(image, 0); 
GaussianI =  enhanceImageLoG(image, sigma); 

figure,
subplot(2,1,1), montage({image, laplacianI, 255*LoGfilt(image,0)}, 'size', [1,3]); title('Laplacian'); 
subplot(2,1,2), montage({image, GaussianI, 255*LoGfilt(image,sigma)}, 'size', [1,3]); title('LoG'); 
    
    %     figure, colormap('gray'), imagesc(enhanced); 