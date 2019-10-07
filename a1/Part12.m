close all;clear; 

% test input
image = imread("images/pizza.png"); 
sgtitle('Aliasing'); 
subplot(1,2,1), imshow(subsampleImage(image, 16, 0)); title('w/o smoothing');
subplot(1,2,2), imshow(subsampleImage(image, 16, 0.5)); title('with smoothing');
%fft2, fftshift