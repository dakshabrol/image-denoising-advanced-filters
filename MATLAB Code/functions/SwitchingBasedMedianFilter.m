function [output] = SwitchingBasedMedianFilter(image)
image = im2double(image);

% Define the window size
window_size = 3;

% Define the threshold value
threshold = 10;

% Get the size of the image
[rows, cols] = size(image);

% Initialize the output image
output = zeros(rows, cols);

% Apply the filter to each pixel in the image
for i = 1:rows
    for j = 1:cols
        
        % Get the window around the current pixel
        window = image(max(i-window_size,1):min(i+window_size,rows), ...
                       max(j-window_size,1):min(j+window_size,cols));
        
        % Calculate the median of the window
        median_val = median(window(:));
        
        % Calculate the absolute difference between the current pixel and
        % the median of the window
        abs_diff = abs(image(i,j) - median_val);
        
        % If the absolute difference is less than the threshold value,
        % use the median value as the output pixel value. Otherwise, use
        % the original pixel value.
        if abs_diff < threshold
            output(i,j) = median_val;
        else
            output(i,j) = image(i,j);
        end
        
    end
end
output = im2uint8(output);
end

%(1) MATLAB Mean Filter | Delft Stack. https://www.delftstack.com/howto/matlab/mean-filter-matlab/
%(2) Median Filter Matlab Code | download free open source Matlab toolbox .... http://freesourcecode.net/matlabprojects/57495/median-filter-matlab-code
%(3) image - Matlab Median Filter Code - Stack Overflow. https://stackoverflow.com/questions/27535535/matlab-median-filter-code
%(4) Switching Median Filter - File Exchange - MATLAB Central. https://www.mathworks.com/matlabcentral/fileexchange/112630-switching-median-filter
%(5) Adaptive Switching Median Filter - File Exchange - MATLAB Central. https://www.mathworks.com/matlabcentral/fileexchange/74147-adaptive-switching-median-filter/