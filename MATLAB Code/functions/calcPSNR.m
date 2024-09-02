function psnrVal = calcPSNR(image1, image2)

% Ensure that the two images have the same dimensions
if ~isequal(size(image1), size(image2))
    error('Images must have the same dimensions');
end

% Convert the images to uint8 type
image1 = im2uint8(image1);
image2 = im2uint8(image2);

% Compute the maximum pixel value
max_pixel_value = double(intmax(class(image1)));

% Compute the mean squared error
mse = immse(image1, image2);

% Compute the PSNR
if mse == 0
    psnrVal = Inf;
else
    psnrVal = 10*log10(max_pixel_value^2/mse);
end

end