function sub_img = subsampleImage(image, subs, sigma)
      
    % LPF smoothing
    if sigma > 0
        image = LPF(image, sigma, max(5, round(3.5*sigma))); 
    end

    % subsampling 
    sub_img = image(1:subs:end, 1:subs:end, :);  

end 