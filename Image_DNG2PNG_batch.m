function Image_DNG2PNG_batch(procpath)

if isempty(procpath) == 1
    procpath = pwd;
end

procpath = [procpath filesep];


files = dir([procpath filesep '*.dng']);

for n = 1:length(files)
    filename = fullfile(procpath,files(n).name);

    Image_DNG2PNG(filename);
    
end

end