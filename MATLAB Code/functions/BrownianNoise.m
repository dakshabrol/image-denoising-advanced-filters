function noisyImg = BrownianNoise(img, noiseLevel)

[rows, cols, channels] = size(img);

% Compute the standard deviation of the Gaussian distribution.
sigma = double(intmax(class(img))) * (noiseLevel / 100);

% Generate a 2D Gaussian noise pattern with zero mean and unit variance.
noise = randn(rows, cols, channels);

% Compute the Brownian noise by performing a 2D cumulative sum on the
% Gaussian noise pattern.
brownian_noise = cumsum(cumsum(noise, 1), 2);

% Scale the Brownian noise to have the desired standard deviation.
brownian_noise = brownian_noise / std(brownian_noise(:)) * sigma;

noisyImg = uint8(double(img) + brownian_noise);

end
