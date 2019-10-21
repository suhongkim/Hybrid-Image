function filtered = LPF(image, sigma, kernelsize)
    image = im2double(image); 
    g = fspecial('gaussian', kernelsize, sigma);  
    filtered = imfilter(image, g, 'symmetric'); 
end