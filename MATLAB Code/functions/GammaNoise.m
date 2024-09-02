function noisyImg = GammaNoise(img, noiseLevel)
    img = im2double(img);
    image_mean = mean(img(:));
    image_var = var(img(:));

    % Calculate the shape and scale parameters of the Gamma distribution
    shape = image_mean^2 / image_var;
    scale = image_var / image_mean;

    noise = (noiseLevel / 100) * scale * gamrnd(shape, 1, size(img));
    noisyImg = img + noise;
    noisyImg = max(0, min(1, noisyImg));
    noisyImg = im2uint8(noisyImg);
end
