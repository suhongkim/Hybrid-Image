close all;clear; 
addpath('images');

%% Resize 
image = imread('images/computer.png'); 
figure, 
subplot(1,5,1), imshow(image); title('Original'); 
subplot(1,5,2), imshow(subsampleImage(image, 2, 0)); title('subs = 1/2'); 
subplot(1,5,3), imshow(subsampleImage(image, 4, 0)); title('subs = 1/4'); 
subplot(1,5,4), imshow(subsampleImage(image, 8, 0)); title('subs = 1/8'); 
subplot(1,5,5), imshow(subsampleImage(image, 16, 0)); title('subs = 1/16'); 


%% Anti-aliasing
% high frequency 
imageH = imread('images/computer.png'); 
freqH = fftshift(fft2(rgb2gray(imageH))); 
% low frequency 
imageL = imread('images/cup.png'); 
freqL = fftshift(fft2(rgb2gray(imageL))); 
figure, 
subplot(2,2,1), imshow(imageH); title('High-Freq Image'); 
subplot(2,2,2), colormap('gray'); imagesc(log(abs(freqH))); title('FFT of High-Freq Image');
subplot(2,2,3), imshow(imageL); title('low-Freq Image'); 
subplot(2,2,4), colormap('gray'); imagesc(log(abs(freqL))); title('FFT of Low-Freq Image')

for i = 1:2
    if i==1, image = imageH; freq = freqH;
    else, image = imageL; freq = freqL; end
    figure, 
    subplot(1,5,1), imshow(subsampleImage(image, 16, 0)); title('sigma = 0'); 
    subplot(1,5,2), imshow(subsampleImage(image, 16, 1)); title('sigma = 1'); 
    subplot(1,5,3), imshow(subsampleImage(image, 16, 2)); title('sigma = 2'); 
    subplot(1,5,4), imshow(subsampleImage(image, 16, 3)); title('sigma = 3'); 
    subplot(1,5,5), imshow(subsampleImage(image, 16, 5)); title('sigma = 5');   
end


%% plot results
sigmaH = 6; 
sigmaL = 3;

image = imageL; 
for s = [2, 4, 8, 16]
    %subsampling without smoothing
    imgN = subsampleImage(image, s, 0); 
    freqN = fftshift(fft2(rgb2gray(imgN))); 

    % subsampling with smoothing (high)
    imgH = subsampleImage(image, s, sigmaH); 
    freqH = fftshift(fft2(rgb2gray(imgH))); 

    % subsampling with smoothing (low)
    imgL = subsampleImage(image, s, sigmaL); 
    freqL = fftshift(fft2(rgb2gray(imgL))); 
    
    % plot
    figure,
    subplot(2,3,1), imagesc(imgN); title('w/o smoothing');
    subplot(2,3,2), imagesc(imgH); title(['with sigma=', num2str(sigmaH)]);
    subplot(2,3,3), imagesc(imgL); title(['with sigma=', num2str(sigmaL)]);
    subplot(2,3,4), colormap('gray'); imagesc(log(abs(freqN))); 
    subplot(2,3,5), colormap('gray'); imagesc(log(abs(freqH))); 
    subplot(2,3,6), colormap('gray'); imagesc(log(abs(freqL))); 
end
