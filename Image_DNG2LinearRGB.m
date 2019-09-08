function image = Image_DNG2LinearRGB(filename)
%IMAGE_DNG2LINEARRGB Get linear image and RGB separated image without demosaicing.
% IMAGE = DNG2LINEARRGB(FILENAME) returns image struct that contains
% separated RGB and Linear image from image file that is specified in FILENAME. 

image = struct;

raw = DNG_ExtractImage(filename);
meta_info = imfinfo(filename);

image.lin = LeniarizeImage(raw, meta_info);
[image.red, image.green, image.blue] = ImgProc_SplitRGB(image.lin, 'rggb');

end