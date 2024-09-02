function noisyImg = RicianNoise(img, noiseLevel)
    img = im2double(img);
    [rows, cols, channels] = size(img);

    % Calculate the standard deviation of Gaussian noise based on the noise level
    sigma = sqrt(noiseLevel / 100);

    % Generate two independent Gaussian noise matrices for real and imaginary channels
    real_noise = normrnd(0, sigma, rows, cols, channels);
    imag_noise = normrnd(0, sigma, rows, cols, channels);

    % Add the real noise to the image and compute the magnitude of the complex signal
    noisyImg = sqrt((img + real_noise).^2 + imag_noise.^2);

    noisyImg = max(0, min(1, noisyImg));
    noisyImg = im2uint8(noisyImg);
end