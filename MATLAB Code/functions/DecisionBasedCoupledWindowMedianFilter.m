function [output] = DecisionBasedCoupledWindowMedianFilter(image)
    image = im2double(image);
    % Define window size
    windowSize = 3;
    % Define threshold
    threshold = 10;
    % Define window size increment
    windowSizeIncrement = 2;
    % Define maximum window size
    maxWindowSize = 9;
    
    % Get image size
    [rows, cols] = size(image);
    
    % Initialize output image
    output = zeros(rows, cols);
    
    % Loop through each pixel of the image
    for i = 1:rows
        for j = 1:cols
            % Get current pixel value
            pixelValue = image(i, j);
            
            % Initialize window size
            currentWindowSize = windowSize;
            
            % Initialize window sum and count
            windowSum = 0;
            windowCount = 0;
            
            % Loop through each pixel in the window
            for k = -currentWindowSize:currentWindowSize
                for l = -currentWindowSize:currentWindowSize
                    % Get current row and column indices
                    rowIdx = i + k;
                    colIdx = j + l;
                    
                    % Check if current index is within bounds of image
                    if (rowIdx >= 1 && rowIdx <= rows && colIdx >= 1 && colIdx <= cols)
                        % Get current pixel value
                        currentPixelValue = image(rowIdx, colIdx);
                        
                        % Check if difference between current pixel value and center pixel value is less than threshold
                        if (abs(currentPixelValue - pixelValue) < threshold)
                            % Add current pixel value to window sum and increment count
                            windowSum = windowSum + currentPixelValue;
                            windowCount = windowCount + 1;
                        end
                        
                        % Check if window count is greater than zero and less than or equal to maxWindowSize
                        if (windowCount > 0 && windowCount <= maxWindowSize)
                            % Calculate median of pixels in window and set output pixel value to median value
                            output(i, j) = median(windowSum / windowCount);
                        else
                            % Increase window size by increment amount if less than maxWindowSize
                            if (currentWindowSize < maxWindowSize)
                                currentWindowSize = currentWindowSize + windowSizeIncrement;
                            end
                        end
                        
                    end
                    
                end
                
            end
            
        end
        
    end
    output = im2uint8(output);
end

%(1) Decision Based Trimmed Adaptive Windows Median Filter - IJSR. https://www.ijsr.net/archive/v4i10/SUB158526.pdf
%(2) Median filter - MATLAB - MathWorks. https://www.mathworks.com/help/dsp/ref/dsp.medianfilter-system-object.html
%(3) Median Filter Matlab Code | download free open source Matlab toolbox .... http://freesourcecode.net/matlabprojects/57495/median-filter-matlab-code
%(4) median-filter · GitHub Topics · GitHub. https://github.com/topics/median-filter?l=matlab
%(5) Adaptive Median Filter (MATLAB Code) - File Exchange - MathWorks. https://www.mathworks.com/matlabcentral/fileexchange/30068-adaptive-median-filter-matlab-code
%(6) A new approach for high density saturated impulse noise ... - SpringerLink. https://link.springer.com/article/10.1007/s11760-013-0487-5
%(7) A new approach for high density saturated impulse noise ... - ResearchGate. https://www.researchgate.net/publication/257731791_A_new_approach_for_high_density_saturated_impulse_noise_removal_using_decision-based_coupled_window_median_filter
%(8) An Adaptive Weighted Min-Mid-Max Value Based Filter for Eliminating .... https://link.springer.com/article/10.1007/s11277-021-08314-5