function filt = LoGfilt(image, sigma)
    % define kernels 
    if sigma > 0
        kernel = 9; 
        gaussian = fspecial('gaussian', kernel, sigma); 
        laplacian = [[0 -1 0];[-1 4 -1];[0 -1 0]]; 
        LoG = conv2(gaussian, laplacian);
    else
        LoG = [[0 -1 0];[-1 4 -1];[0 -1 0]]; 
    end
    
%     surf(LoG); 
%     h = fftshift(fft2(LoG)); 
%     colormap('gray'); 
%     subplot(1,2,1), imagesc(abs(h)); 
%     subplot(1,2,2), imagesc(1-LoG);  

    % filter image
    filt = imfilter(image, LoG, 'symmetric');
    
    
end