function a = hms2rad(h,m,s)

if nargin == 1
    if length(h) ~= 3
        error('Invalid argument.')
    end
    
    s = h(3);
    m = h(2);
    h = h(1);
end

a = deg2rad(hms2deg(h,m,s));

end