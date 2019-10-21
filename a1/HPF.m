function filtered = HPF(image, sigma, kernelsize)
    image = im2double(image); 
    hpf = zeros(kernelsize, kernelsize); 
    hpf(round(kernelsize/2), round(kernelsize/2)) = 1; 
    hpf = hpf - fspecial('gaussian', kernelsize, sigma);  
    filtered = imfilter(image, hpf, 'symmetric'); 
end