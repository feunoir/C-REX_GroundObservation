function [ss,iso,ch,mean] = Image_SolidCircleAreaMean(filepath, radius, centerOffset)

if nargin == 2
    %   offset from center of image
    centerOffset = [0 0];
end

% filepath = 'D:\‘²‹ÆŒ¤‹†\C-REX\BaƒtƒBƒ‹ƒ^Ï•ª‹…ÀŒ±\Ba+1.00\dng\composite\SS30_ISO6400_B_mean.png';
[~, name,~] = fileparts(filepath);

param = sscanf(name, 'SS%d_ISO%d_%c_m,ean');

ss = param(1);
iso = param(2);
ch = char(param(3));

%   input image
image = im2double(imread(filepath));


%   get size of image;
imageSize = size(image);

%   set offsets
center = round(imageSize./2) + centerOffset;

mask = GenerateMask_Circle(imageSize, center, radius);
maskTrueNum = nnz(mask);
    
maskedImage = image .* mask;
    
mean_double = sum(sum(maskedImage)) ./ maskTrueNum;

mean = im2uint16(mean_double);

end


% end