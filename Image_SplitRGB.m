function [r,g,b] = Image_SplitRGB(image,align)
% [R,G,B] = IMAGE_SPLITRGB(IMAGE,ALIGN)
% 
% 


% ベイヤー配列バラし
%     1   2 
%   ------------
% 1 | r | g | ..
%   ------------
% 2 | g | b | ..
%   ------------
%   | : | : |
% 
% 1:2:end -> 1から2ごとにend(配列最後の要素)まで
switch align
    case 'rggb'
        r = image(1:2:end, 1:2:end);
        %g = (image(1:2:end, 2:2:end) + image(2:2:end, 1:2:end)) ./ 2;
        %g = (image(1:2:end, 2:2:end) + image(2:2:end, 1:2:end));
        g = im2uint16( mean( cat( 3, im2double(image(1:2:end, 2:2:end)), im2double(image(2:2:end, 1:2:end)) ), 3 ) );
        b = image(2:2:end, 2:2:end);
    case 'bggr'
        r = image(2:2:end, 2:2:end);
        %g = (image(1:2:end, 2:2:end) + image(2:2:end, 1:2:end)) ./ 2;
        %g = (image(1:2:end, 2:2:end) + image(2:2:end, 1:2:end));
        g = im2uint16( mean( cat(3, im2double(image(1:2:end, 2:2:end)), im2double(image(2:2:end, 1:2:end))), 3 ));
        b = image(1:2:end, 1:2:end);
    case 'grbg'
        r = image(1:2:end, 2:2:end);
        %g = (image(1:2:end, 1:2:end) + image(1:2:end, 1:2:end)) ./ 2;
        %g = (image(1:2:end, 1:2:end) + image(1:2:end, 1:2:end));
        g = im2uint16( mean( cat(3, im2double(image(1:2:end, 1:2:end)), im2double(image(2:2:end, 2:2:end))), 3 ));
        b = image(2:2:end, 1:2:end);
    case 'gbrg'
        r = image(1:2:end, 2:2:end);
        %g = (image(1:2:end, 2:2:end) + image(2:2:end, 1:2:end)) ./ 2;
        %g = (image(1:2:end, 2:2:end) + image(2:2:end, 1:2:end));
        g = im2uint16( mean( cat(3, im2double(image(1:2:end, 1:2:end)), im2double(image(2:2:end, 2:2:end))), 3 ));
        b = image(2:2:end, 1:2:end);
    otherwise
        error('ImProc:SplitRGB: Invalid types of align.');
end
end