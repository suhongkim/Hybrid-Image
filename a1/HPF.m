function filtered = HPF(image, sigma, kernelsize)
   filtered = image - LPF(image, sigma, kernelsize);  
   
end