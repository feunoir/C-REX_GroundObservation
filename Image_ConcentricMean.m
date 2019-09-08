function [circularMean, maskTrueNum] = Image_ConcentricMean(image, centerOffset)

%filepath = 'D:\C-REX\BaƒtƒBƒ‹ƒ^Ï•ª‹…ÀŒ±\Ba+1.00\dng\composite\SS30_ISO6400_B_mean.png';

%   input image
%image = imread(filepath);

if nargin == 1
    %   offset from center of image
    centerOffset = [0 0];
end

if isstring(image)
    img = imread(image);
else
    img = image;
end
    
if ~isfloat(img)
    img = im2double(img);
end

%   get size of image;
imageSize = size(img);

center = imageSize./2 + centerOffset;

radiusMax = min(center(2),imageSize(2)-center(2));
circularMean = zeros([1 radiusMax]);
maskTrueNum = zeros([1 radiusMax]);

for radius = 1:radiusMax
    mask = GenerateMask_Ring(imageSize, center, radius);
    maskTrueNum(radius) = nnz(mask);
    
    maskedImage = img .* mask;
    
    circularMean(radius) = im2uint16(sum(sum(maskedImage)) ./ maskTrueNum(radius));
end

end