function filt = LoGfilt(image, sigma)
    % define kernels 
    if sigma > 0
        kernel = max(9, round(3.5*sigma)); 
        gaussian = fspecial('gaussian', kernel, sigma); 
        laplacian = [[0 -1 0];[-1 4 -1];[0 -1 0]]; 
        LoG = conv2(gaussian, laplacian);
    else
        LoG = [[0 -1 0];[-1 4 -1];[0 -1 0]]; 
    end

    % filter image
    image = im2double(image); 
    filt = imfilter(image, LoG, 'symmetric');
end