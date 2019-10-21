close all;clear; 

% test input
addpath('./images'); 
image = im2double(imread('./images/jump.png')); 
% resize image for convenience 
image = imresize(image, 0.5); 

% test param 
sigma_list = [0.5, 1, 3.5]; 
kernel_list = [5, 15]; 
count = 1; 
% Show filtered images
for s = 1:length(sigma_list)
    for k = 1:length(kernel_list)
        sigma = sigma_list(s); 
        kernelsize = kernel_list(k); 

        % for plot hpf, normalize it 
        hpf = HPF(image, sigma, kernelsize); 
        hpf_norm = (hpf - min(hpf(:))) / (max(hpf(:)) - min(hpf(:)));  
        
        %plot
        subplot(length(sigma_list),length(kernel_list),count),
        montage({image, LPF(image, sigma, kernelsize), hpf_norm}, 'size', [1,3]); 
        title(['sigma=', num2str(sigma), ', kernel=', num2str(kernelsize)]); 
        count = count + 1; 
    end
end

