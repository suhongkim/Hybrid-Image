function im12 = hybridImage(im1, im2, cutoff_low, cutoff_high)
    sigmaL = 1 / (2*pi*cutoff_low); % 8
    sigmaH = 1 / (2*pi*cutoff_high); % 4
    
    % filtering
    im1filt = LPF(im2double(im1), sigmaL, max(5,round(3*sigmaL)));
    im2filt = HPF(im2double(im2), sigmaH, max(5,round(3*sigmaH)));
      
    % hybrid 
    im12 = (im1filt + im2filt) / 2; 
    im12_norm = (im12 - min(im12(:))) / (max(im12(:)) - min(im12(:)));  
    im12 = uint8(255*im12_norm); 
    
    figure, 
    subplot(2,2,1), imshow(im1); title('Image1(original)');
    subplot(2,2,2), imshow(im1filt); title('LPF(Image1)'); 
    subplot(2,2,3), imshow(im2); title('Image2(original)');
    im2filt_norm = (im2filt - min(im2filt(:))) / (max(im2filt(:)) - min(im2filt(:))); 
    subplot(2,2,4), imshow(im2filt_norm); title('HPF(Image2)'); 
     
end