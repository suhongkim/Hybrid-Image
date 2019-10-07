function filtered = LPF(image, sigma, kernelsize)
   g = fspecial('gaussian', kernelsize, sigma);  
   filtered = imfilter(image, g, 'symmetric'); 
end