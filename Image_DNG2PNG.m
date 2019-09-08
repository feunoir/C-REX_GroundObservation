function Image_DNG2PNG(filename, en_imgsplit)
%IMAGE_DNG2PNG Convert image file from DNG to PNG.
% DNG2PNG(FILENAME, EN_IMGSPLIT) converts image that from DNG to PNG 
% without demosaicing. And also it is able to export RGB separated image
% when EN_IMGSPLIT is enabled.

[filepath, name, ] = fileparts(filename);
if isempty(filepath) == 0
    filepath = [filepath filesep];
end
dirname = filepath+string(["linear" "red" "green" "blue"]);

if nargin == 1
    en_imgsplit = 1;
end

%   Is RGB splitted image output enabled?
switch en_imgsplit
    case 1
        n = 4;
    case 0
        n = 1;
end

%   Are the each output directories exist?
for i = 1:n
    if exist(dirname{i}, 'dir') == 0
        mkdir(dirname{i});
    end
end

image = Image_DNG2LinearRGB(filename);

imwrite(image.lin, fullfile(dirname{1}, strcat(name, '.png')));
if en_imgsplit == 1
    imwrite(image.red, fullfile(dirname{2}, strcat(name, '_red.png')));
    imwrite(image.green, fullfile(dirname{3}, strcat(name, '_green.png')));
    imwrite(image.blue, fullfile(dirname{4}, strcat(name, '_blue.png')));
end    

end