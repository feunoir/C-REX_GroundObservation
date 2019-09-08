function raw = Image_DNG_ExtractImage(filename)
%TIFF_EXTRACTIMAGE Extract image area from TIFF/EP or DNG image.
% RAW = TIFF_EXTRACTIMAGE(FILENAME) returns only the image part of DNG
% (or TIFF/EP) file that is specified in FILENAME.

warning off MATLAB:tifflib:TIFFReadDirectory:libraryWarning
t = Tiff(filename, 'r');

offsets = getTag(t, 'SubIFD');
setSubDirectory(t, offsets(1));

raw = read(t);

close(t);

meta_info = imfinfo(filename);

% 画像原点と画像サイズ取得
x_origin = meta_info.SubIFDs{1}.ActiveArea(2)+1;
width = meta_info.SubIFDs{1}.DefaultCropSize(1);
y_origin = meta_info.SubIFDs{1}.ActiveArea(1)+1;
height = meta_info.SubIFDs{1}.DefaultCropSize(2);

% rawから有効エリアを抜き出し
raw = raw(y_origin:y_origin+height-1, x_origin:x_origin+width-1);
end