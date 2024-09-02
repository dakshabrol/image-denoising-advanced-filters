function [output] = DualDomainImageDenoisingFilter(image)

sigma = 200; % internal parameter (can be changed, based on image)

% Convert the image to double precision
I = im2double(image);

% Compute the size of the image
[M, N] = size(I);

% Compute the Fourier transform of the image
F = fft2(I);

% Compute the frequency coordinates
u = 0:(M-1);
v = 0:(N-1);
idx = find(u > M/2);
u(idx) = u(idx) - M;
idy = find(v > N/2);
v(idy) = v(idy) - N;
[V, U] = meshgrid(v, u);

% Construct the Gaussian filter in the frequency domain
G = exp(-(U.^2 + V.^2)/(2*sigma^2));

% Apply the filter to the Fourier transform of the image
Ff = F .* G;

% Compute the inverse Fourier transform
f = real(ifft2(Ff));

% Crop the result to the original size
output = f(1:M, 1:N);

output = im2uint8(output);
end
