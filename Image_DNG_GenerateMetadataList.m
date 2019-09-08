function Image_DNG_GenerateMetadataList(procpath)
%


if isempty(procpath) == 1
    procpath = pwd;
end

files = dir([procpath filesep '*.dng']);

fp = fopen([procpath filesep 'IMG_MetadataList.csv'], 'w');

fprintf(fp, "Filename,DateTime,Subsec,ExposureTime,ISO\r\n");

for n = 1:length(files)
    filename = fullfile(procpath,files(n).name);
    
    meta = imfinfo(filename);
    
    timerecord = meta.DigitalCamera.DateTimeOriginal;
    subsec = meta.DigitalCamera.SubsecTimeOriginal;
    exptime = meta.DigitalCamera.ExposureTime;
    iso = meta.DigitalCamera.ISOSpeedRatings;
    
    fprintf(fp, "%s,%s,%s,%g,%d\r\n", files(n).name, timerecord, subsec, exptime, iso);
end

fclose(fp);

end