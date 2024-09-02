clear; close all; clc;
addpath('functions');
addpath('images');

%% Step 1: Reading Image

% Remove the '%' sign from beginning of syntax to use that image.

% Out of 6 images, only 1 to be used at a time. So remove % sign from the
% image you want to use

%img = imread('sample-images\coins.jpg');
img = imread('sample-images\leaves.jpg');
%img = imread('sample-images\satellite1.jpg');
%img = imread('sample-images\satellite2.jpg');
%img = imread('sample-images\scenery.jpg');
%img = imread('sample-images\train.jpg');


%% Step 2: Adding all noises at 10% noise level

noiseLevel = 10;

noisyImg1 = GaussianNoise(img, noiseLevel);
noisyImg2 = ImpulseNoise(img, noiseLevel);
noisyImg3 = PeriodicNoise(img, noiseLevel);
noisyImg4 = PoissonNoise(img);
noisyImg5 = SpeckleNoise(img, noiseLevel);
noisyImg6 = GammaNoise(img, noiseLevel);
noisyImg7 = RayleighNoise(img, noiseLevel);
noisyImg8 = QuantizationNoise(img, noiseLevel);
noisyImg9 = BrownianNoise(img, noiseLevel);
noisyImg10 = RicianNoise(img, noiseLevel);

% Add the images together
noisyImg = noisyImg1 + noisyImg2 + noisyImg3 + noisyImg4 + noisyImg5 + noisyImg6 + noisyImg7 + noisyImg8 + noisyImg9 + noisyImg10;

%% Step 3: Converting the noisy image into R, G and B channel

R = noisyImg(:,:,1); G = noisyImg(:,:,2); B = noisyImg(:,:,3);

%% Step 4: Selecting the filter & denoising the noisy image

% Ask user to select the filter
disp('Select the filter you want to use for denoising:');
disp('1. Switching Based Median Filter');
disp('2. Decision Based Coupled Window Median Filter');
disp('3. Noise Density Range Sensitive Mean Median Filter');
disp('4. Adaptive Median Filter');
disp('5. Dual Domain Image Denoising Filter')
filter_choice = input('Enter your choice (1-5): ');

% Apply the selected filter to denoise the image
switch filter_choice
    case 1 % Switching Based Median Filter
        denoised_img_R = SwitchingBasedMedianFilter(R);
        denoised_img_G = SwitchingBasedMedianFilter(G);
        denoised_img_B = SwitchingBasedMedianFilter(B);
        filter_name = 'Switching Based Median Filter';
    case 2 % Decision Based Coupled Window Median Filter
        denoised_img_R = DecisionBasedCoupledWindowMedianFilter(R);
        denoised_img_G = DecisionBasedCoupledWindowMedianFilter(G);
        denoised_img_B = DecisionBasedCoupledWindowMedianFilter(B);
        filter_name = 'Decision Based Coupled Window Median Filter';
    case 3 % Noise Density Range Sensitive Mean Median Filter
        denoised_img_R = NoiseDensityRangeSensitiveMeanMedianFilter(R);
        denoised_img_G = NoiseDensityRangeSensitiveMeanMedianFilter(G);
        denoised_img_B = NoiseDensityRangeSensitiveMeanMedianFilter(B);
        filter_name = 'Noise Density Range Sensitive Mean Median Filter';
    case 4 % Adaptive Median Filter
        denoised_img_R = AdaptiveMedianFilter(R);
        denoised_img_G = AdaptiveMedianFilter(G);
        denoised_img_B = AdaptiveMedianFilter(B);
        filter_name = 'Adaptive Median Filter';
    case 5 % Dual Domain Image Denoising Filter
        denoised_img_R = DualDomainImageDenoisingFilter(R);
        denoised_img_G = DualDomainImageDenoisingFilter(G);
        denoised_img_B = DualDomainImageDenoisingFilter(B);
        filter_name = 'Dual Domain Image Denoising Filter';
    otherwise
        error('Invalid choice. Please enter a number between 1 and 5.');
end

% Combining the denoised R, denoised G and denoised B into one
filtered_img = cat(3, denoised_img_R, denoised_img_G, denoised_img_B);

%% Step 5: Displaying images in one plot

% Display Original, Noisy and Filtered Image together
subplot(1,3,1); imshow(img); title('Original Image');
subplot(1,3,2); imshow(noisyImg); title(['Noisy Image - All Noises at ', num2str(noiseLevel), '% noise level']);
subplot(1,3,3); imshow(filtered_img); title('Filtered Image');

%% Step 6: Calculating the evaluation parameters for image quality assessment
% Calculate MSE, RMSE, PSNR, SSIM, IEF

mseVal = calcMSE(img, filtered_img);
rmseVal = calcRMSE(img, filtered_img);
psnrVal = calcPSNR(img, filtered_img);
ssimVal = calcSSIM(img, filtered_img);
iefVal = calcIEF(img, noisyImg, filtered_img);

% Display the evaluation parameters
disp(' ');
disp('Evaluation Parameters for image quality assessment- ');
fprintf('MSE: %f\n', mseVal);
fprintf('RMSE: %f\n', rmseVal);
fprintf('PSNR: %f\n', psnrVal);
fprintf('SSIM: %f\n', ssimVal);
fprintf('IEF: %f\n', iefVal);

