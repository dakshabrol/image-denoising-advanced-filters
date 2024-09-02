function noisyImg = ImpulseNoise(img, noiseLevel)
    img = im2uint8(img);
    prob = noiseLevel / 100;
    noisyImg = imnoise(img, 'salt & pepper', prob);
end