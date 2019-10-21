function enhanced = enhanceImageLoG(image, sigma)
    
    enhanced = im2double(image) + (LoGfilt(image, sigma)); 
   % enhanced = (enhanced - min(enhanced(:)))/(max(enhanced(:))-min(enhanced(:)));
    
end