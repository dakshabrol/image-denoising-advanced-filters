function noisyImg = PeriodicNoise(img, noiseLevel)
    img = im2double(img);
    [height, width, ~] = size(img);

    % Generate the frequency domain grid
    [x, y] = meshgrid(1:width, 1:height);

    % Define the frequency of the noise pattern
    freq = 200;

    % Generate the noise pattern
    noise_pattern = sin(2*pi*freq*x/width) + sin(2*pi*freq*y/height);

    % Normalize the noise pattern to have zero mean and unit variance
    noise_pattern = (noise_pattern - mean(noise_pattern(:))) / std(noise_pattern(:));
    
    % Calculate the standard deviation of the noise
    noise_std = noiseLevel / 100 * std(img(:));

    noise_image = noise_std * noise_pattern;
    noisyImg = img + noise_image;
    noisyImg = max(0, min(1, noisyImg));
    noisyImg = im2uint8(noisyImg);
end
