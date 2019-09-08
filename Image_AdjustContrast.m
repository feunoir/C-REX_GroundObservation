function result = Image_AdjustContrast(img, contrast, contrastCenter)

if nargin == 2
    contrastCenter = 0.5;
end

result = im2uint16((im2double(img)-contrastCenter).*contrast+contrastCenter);

end