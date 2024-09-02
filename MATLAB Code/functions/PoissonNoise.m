function noisyImg = PoissonNoise(img)
    img = im2uint8(img);
    noisyImg = imnoise(img, 'poisson');
end
