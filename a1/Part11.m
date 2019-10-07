close all;clear; 

% test input
image = imread("images/pizza.png"); 

% test param 
sigma_list = [0.5, 1, 3.5]; 
kernel_list = [5, 15]; 

% Show filtered images
for s = 1:length(sigma_list)
    for k = 1:length(kernel_list)
        sigma = sigma_list(s); 
        kernelsize = kernel_list(k); 
        %plot
        figure, 
        sgtitle(['sigma = ', num2str(sigma), ', kernel = ', num2str(kernelsize)]);
        subplot(1,3,1), imshow(image); title('Original');  
        subplot(1,3,2), imshow(LPF(image, sigma, kernelsize)); title('LPF'); 
        subplot(1,3,3), imshow(HPF(image, sigma, kernelsize)); title('HPF'); 
        
    end
end

