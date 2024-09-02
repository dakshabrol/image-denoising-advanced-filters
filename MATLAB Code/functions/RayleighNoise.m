function noisyImg = RayleighNoise(img, noiseLevel)
  img = im2double(img);
  std_dev = sqrt(-log(1 - (noiseLevel / 100)^2) / 2);

  % Generate a matrix of random numbers from a Rayleigh distribution with the calculated standard deviation
  noise_matrix = std_dev * randn(size(img)) + std_dev * randn(size(img)) * 1i;

  noisyImg = abs(ifft2(fft2(img) + fft2(noise_matrix)));
  noisyImg = max(0, min(1, noisyImg));
  noisyImg = im2uint8(noisyImg);
end