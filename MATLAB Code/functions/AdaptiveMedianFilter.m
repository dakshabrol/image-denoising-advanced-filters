function [output] = AdaptiveMedianFilter(image)
image = im2double(image);
[m,n] = size(image);
output = zeros(m,n);
for i=1:m
    for j=1:n
        if (i==1 || j==1 || i==m || j==n)
            output(i,j) = image(i,j);
        else
            % 3x3 window
            w = image(max(1,i-1):min(m,i+1),max(1,j-1):min(n,j+1));
            % sort window elements
            s = sort(w(:));
            % calculate median value of window
            medianVal = s(5);
            % calculate range of pixel values in window
            rangeVal = max(s) - min(s);
            % calculate threshold value based on range of pixel values
            if (rangeVal < 20)
                thresholdVal = medianVal;
            else
                % 5x5 window
                w = image(max(1,i-2):min(m,i+2),max(1,j-2):min(n,j+2));
                % sort window elements
                s = sort(w(:));
                % calculate median value of window
                medianVal = s(13);
                % calculate range of pixel values in window
                rangeVal = max(s) - min(s);
                % calculate threshold value based on range of pixel values
                if (rangeVal < 20)
                    thresholdVal = medianVal;
                else
                    % 7x7 window
                    w = image(max(1,i-3):min(m,i+3),max(1,j-3):min(n,j+3));
                    % sort window elements
                    s = sort(w(:));
                    % calculate median value of window
                    medianVal = s(25);
                    thresholdVal = medianVal;
                end
            end
            % apply threshold value to center pixel of window
            output(i,j) = thresholdVal;
        end
    end
end
output = im2uint8(output);
end

%(1) GitHub - annikniem/Adaptive-median-filter. https://github.com/annikniem/Adaptive-median-filter
%(2) Adaptive Median Filter (MATLAB Code) - File Exchange - MATLAB Central. https://la.mathworks.com/matlabcentral/fileexchange/30068-adaptive-median-filter-matlab-code
%(3) Adaptive Median Filter (MATLAB Code) - File Exchange - MathWorks. https://www.mathworks.com/matlabcentral/fileexchange/30068-adaptive-median-filter-matlab-code
%(4) Adaptive Median Filter - Massachusetts Institute of Technology. https://lost-contact.mit.edu/afs/inf.ed.ac.uk/group/teaching/matlab-help/R2016b/hdlcoder/examples/adaptive-median-filter.html
%(5) GitHub - mortezamg63/Adaptive-Median-Filter. https://github.com/mortezamg63/Adaptive-Median-Filter