function sub_img = subsampleImage(image, subs, sigma)
     % recursive call
    if subs > 1
        image = subsampleImage(image, floor(subs/2), sigma); 
    end
    
    % LPF smoothing
    if sigma > 0
        image = LPF(image, sigma, 5); 
    end

    % subsampling 
    sub_img = image(1:2:end, 1:2:end, :);  % odd, even?   

end 