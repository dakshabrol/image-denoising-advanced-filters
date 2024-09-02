function mseVal = calcMSE(image1, image2)

% Ensure that the two images have the same dimensions
if ~isequal(size(image1), size(image2))
    error('Images must have the same dimensions');
end

% Convert the images to uint8 type
image1 = im2uint8(image1);
image2 = im2uint8(image2);

% Compute the mean squared error
mseVal = immse(image1, image2);

end