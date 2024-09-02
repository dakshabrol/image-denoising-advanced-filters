function noisyImg = QuantizationNoise(img, noiseLevel)

    % Get the maximum pixel value of the image.
    max_value = double(intmax(class(img)));

    % Compute the quantization step size based on the noise level.
    step_size = max_value / (100 / noiseLevel);

    % Quantize the image.
    quantized_image = floor(double(img) / step_size) * step_size;

    % Add quantization noise.
    quantization_error = double(img) - quantized_image;
    
    noise = (rand(size(img)) - 0.5) * step_size;
    noisyImg = uint8(double(img) + quantization_error + noise);

end
