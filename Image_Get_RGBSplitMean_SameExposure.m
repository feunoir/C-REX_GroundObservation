function Image_Get_RGBSplitMean_SameExposure(dngdir, csvdir)

%dngdir = 'E:\C-REX\Baフィルタ積分球実験\Ba0.20\dng';
%csvdir = 'E:\C-REX\Baフィルタ積分球実験\Ba0.20\Ba0.20_MetaInfoList - コピー.csv';

resdir = strcat(dngdir, filesep, 'composite');

if ~isfolder(resdir)
    mkdir(resdir);
end
imageList = readtable(csvdir);

%   ユニーク露出設定組み合わせリストの作成
uniqueExposureConfigList = unique(imageList(:, {'ExposureTime', 'ISO'}));

%   読み込んだ画像の露光設定組み合わせの数
uniqueExposureConfigListNum = height(uniqueExposureConfigList);

for i = 1:uniqueExposureConfigListNum
    %   ユニーク露出設定リストのi番目の露出設定に一致する画像の一覧を作成
    exposuretime = uniqueExposureConfigList{i, 'ExposureTime'};
    iso = uniqueExposureConfigList{i, 'ISO'};
    
    pickupList = imageList(imageList.ExposureTime == exposuretime & imageList.ISO == iso, :);
    pickupListNum = height(pickupList); 
    
    pickupFilepath = cell([1 pickupListNum]);
    pickupImage = cell([1 pickupListNum]);
    
    pickupImageSplitted = cell([1 3]);
    
    for j = 1:pickupListNum
        %   ユニーク露出設定リストの上から順にファイル名を抽出し画像を開く
        pickupFilepath{j} = strcat(dngdir, filesep, pickupList{j,'Filename'});
        pickupImage{j} = Image_DNG2LinearRGB(pickupFilepath{j}{1});
        
        pickupImageSplitted{1} = cat(3, pickupImageSplitted{1}, im2double(pickupImage{j}.red));
        pickupImageSplitted{2} = cat(3, pickupImageSplitted{2}, im2double(pickupImage{j}.green));
        pickupImageSplitted{3} = cat(3, pickupImageSplitted{3}, im2double(pickupImage{j}.blue));
    end
    
    %   デバッグしやすいように、RGBを同時に保持できるようにcell格納で実装している
    meanImage = cell([1 3]);
    %medianImage = cell([1 3]);
    for k = 1:3
        meanImage{k} = im2uint16(mean(pickupImageSplitted{k}, 3));
        %medianImage{k} = im2uint16(median(pickupImageSplitted{k}, 3));
    end
    
    imwrite(meanImage{1}, strcat(resdir, filesep, sprintf('SS%d_ISO%d_R_mean.png', exposuretime, iso)));
    %imwrite(medianImage{1}, strcat(resdir, filesep, sprintf('SS%d_ISO%d_R_median.png', exposuretime, iso)));
    
    imwrite(meanImage{2}, strcat(resdir, filesep, sprintf('SS%d_ISO%d_G_mean.png', exposuretime, iso)));
    %imwrite(medianImage{2}, strcat(resdir, filesep, sprintf('SS%d_ISO%d_G_median.png', exposuretime, iso)));
    
    imwrite(meanImage{3}, strcat(resdir, filesep, sprintf('SS%d_ISO%d_B_mean.png', exposuretime, iso)));
    %imwrite(medianImage{3}, strcat(resdir, filesep, sprintf('SS%d_ISO%d_B_median.png', exposuretime, iso)));
end

% end