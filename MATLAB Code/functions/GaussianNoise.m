function noisyImg = GaussianNoise(img, noiseLevel)
    img = im2double(img);
    std_dev = noiseLevel / 100 * (max(img(:)) - min(img(:)));
    noisyImg = imnoise(img, 'gaussian', 0, std_dev^2);
    noisyImg = im2uint8(noisyImg);
end