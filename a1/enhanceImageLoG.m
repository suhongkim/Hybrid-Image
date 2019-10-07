function enhanced = enhanceImageLoG(image, sigma)
    
    enhanced = image + LoGfilt(image, sigma); 
    % normalize? 
    
end