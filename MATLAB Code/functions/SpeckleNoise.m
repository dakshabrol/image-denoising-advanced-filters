function noisyImg = SpeckleNoise(img, noisyLevel)
    img = im2double(img);
    std_dev = noisyLevel / 100 * (max(img(:)) - min(img(:)));
    noisyImg = imnoise(img, 'speckle', std_dev^2);
    noisyImg = im2uint8(noisyImg);
end
