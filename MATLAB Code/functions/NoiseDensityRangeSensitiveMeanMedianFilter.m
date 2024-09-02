function [output] = NoiseDensityRangeSensitiveMeanMedianFilter(image)
image = im2double(image);
[m,n] = size(image);
output = zeros(m,n);
for i=1:m
    for j=1:n
        if (i==1 || j==1 || i==m || j==n)
            output(i,j) = image(i,j);
        else
            % 3x3 window
            w = image(i-1:i+1,j-1:j+1);
            % sort window elements
            s = sort(w(:));
            % calculate mean and median values
            meanVal = mean(s);
            medianVal = median(s);
            % calculate range of pixel values in window
            rangeVal = max(s) - min(s);
            % calculate noise density of window
            noiseDensity = rangeVal / (max(s) + eps);
            % calculate threshold value based on noise density
            if (noiseDensity < 0.15)
                thresholdVal = meanVal;
            elseif (noiseDensity > 0.35)
                thresholdVal = medianVal;
            else
                thresholdVal = (meanVal + medianVal) / 2;
            end
            % apply threshold value to center pixel of window
            output(i,j) = thresholdVal;
        end
    end
end
output = im2uint8(output);
end

%(1) Noise Density Range Sensitive Mean-Median Filter for Impulse Noise .... https://link.springer.com/chapter/10.1007/978-981-15-6067-5_18
%(2) Noise Density Range Sensitive Mean-Median Filter for Impulse Noise .... https://www.researchgate.net/publication/345339238_Noise_Density_Range_Sensitive_Mean-Median_Filter_for_Impulse_Noise_Removal
%(3) matlab - How to remove noise using mean and median filters? - Signal .... https://dsp.stackexchange.com/questions/29924/how-to-remove-noise-using-mean-and-median-filters
%(4) Noise Removal - MATLAB & Simulink - MathWorks. https://www.mathworks.com/help/images/noise-removal.html
%(5) Audio Signal Processing in Matlab | Engineering Education (EngEd .... https://www.section.io/engineering-education/audio-signals-processing-using-matlab/