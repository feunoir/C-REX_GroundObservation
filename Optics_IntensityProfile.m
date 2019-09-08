function profile = Optics_IntensityProfile(procpath, radius)

if isempty(procpath) == 1
    procpath = pwd;
end

procpath = [procpath filesep];

files = dir([procpath filesep '*.png']);

dataNum = length(files);

SS = zeros([dataNum 1], 'uint16');
ISO = zeros([dataNum 1], 'uint16');
Ch = char(zeros([dataNum 1]));
Intensity = zeros([dataNum 1], 'uint16');

for n = 1:length(files)
    filename = fullfile(procpath,files(n).name);

    [SS(n), ISO(n), Ch(n), Intensity(n)] = Image_SolidCircleAreaMean(filename, radius);
end

profile = table(SS,ISO,Ch,Intensity);

end