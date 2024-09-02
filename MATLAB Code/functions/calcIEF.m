function iefVal = calcIEF(original, noisy, filtered)

% Ensure that the two images have the same dimensions
if ~isequal(size(original), size(noisy), size(filtered))
    error('Images must have the same dimensions');
end

% Convert the images to uint8 type
original = im2uint8(original);
noisy = im2uint8(noisy);
filtered = im2uint8(filtered);

% Compute the MSE values for the original and noisy & original and filtered images
MSE1=immse(original, noisy);
MSE2=immse(original, filtered);

% Compute the IEF
iefVal = MSE1/MSE2;

end