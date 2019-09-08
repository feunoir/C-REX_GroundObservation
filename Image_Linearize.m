function corrected = Image_Linearize(image,varargin)
%IMAGE_LINEARIZE Get linearized image with some parameter.
% IMAGE_LINEARIZE(IMAGE,METAINFO)
% IMAGELINEARIZE(IMAGE,BLACK,SATURATION)
% IMAGE_LINEARIZE(IMAGE,TABLE,BLACK,SATURATION)

% argument (image, metainfo)
if nargin == 2
    if ~isstruct(varargin{1})
        error('ImgProc:Linearize: Invalid types of argument 2.');
    end
    
    if ~isfield(varargin{1}, 'SubIFDs') % "SubIFDs"フィールドがあるか？ = 求める形式か？
        error('ImgProc:Linearize: Could not find "SubIFDs".');
    end
    
    % linearize
    if isfield(varargin{1}.SubIFDs{1}, 'LinearizationTable')
        ltab = varargin{1}.SubIFDs{1}.LinearizationTable;
        image = ltab(image+1);
    end
    
    % get blacklevel and whitelevel
    if isfield(varargin{1}.SubIFDs{1}, 'BlackLevel') && isfield(varargin{1}.SubIFDs{1}, 'WhiteLevel')
        black = varargin{1}.SubIFDs{1}.BlackLevel(1);
        saturation = varargin{1}.SubIFDs{1}.WhiteLevel(1);
    else
        error('ImgProc:Linearize: Could not find "BlackLevel" or/and "WhiteLevel".');
    end
    
% argument (image, black, saturation)
% * no linearizing
elseif nargin == 3
    if ~isscalar(varargin{1}) || ~isscalar(varargin{2})
        error('ImgProc:Linearize: Invalid types of argument 2 or/and 3.');
    end
   
    black = varargin{1};
    saturation = varargin{2};
    
elseif nargin == 4
    if ~isnumeric(varargin{1}) || isscalar(varargin{1})
        error('ImgProc:Linearize: Invalid types of argument 2.');
    end
    
    ltab = varargin{1}.SubIFDs{1}.LinearizationTable;
    image = ltab(image+1);
    
    if ~isscalar(varargin{2}) || ~isscalar(varargin{3})
        error('ImProc:Linearize: Invalid types of argument 2 or/and 3.');
    end
   
    black = varargin{2};
    saturation = varargin{3};

end
    
corrected = (image-black) * (2^16 / (saturation-black));
end