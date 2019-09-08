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

% �摜���_�Ɖ摜�T�C�Y�擾
x_origin = meta_info.SubIFDs{1}.ActiveArea(2)+1;
width = meta_info.SubIFDs{1}.DefaultCropSize(1);
y_origin = meta_info.SubIFDs{1}.ActiveArea(1)+1;
height = meta_info.SubIFDs{1}.DefaultCropSize(2);

% raw����L���G���A�𔲂��o��
raw = raw(y_origin:y_origin+height-1, x_origin:x_origin+width-1);
end