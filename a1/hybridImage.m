function im12 = hybridImage(im1, im2, cutoff_low, cutoff_high)
    sigmaL = 10000; %1 / (2*pi*cutoff_low); 
    sigmaH = 1000; %1 / (2*pi*cutoff_high); 
    kernelsize = 100;
    im1 = im2double(im1); 
    im2 = im2double(im2); 
    im1filt = LPF(im1, sigmaL, kernelsize);
    im2filt = HPF(im2, sigmaH, kernelsize);
    im12 = (im1 + im2) / 2; 
    figure, montage({im1, im1filt, im2, im2filt}, 'size', [2, 2]); 
    figure, montage({im1, im2, im12});
    
end