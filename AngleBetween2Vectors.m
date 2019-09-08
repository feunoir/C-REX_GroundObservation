function C = AngleBetween2Vectors(a, b)
%ANGLEOFVECTORS Angle between two vectors in radian.
% C = ANGLEOFVECTORS(A, B) returns angle between two vectors in radian.
% A and B are vectors by polar coodinates and that are 3 length row vectors
% that contain 'azimuth', 'elevation' and 'radius' in order.

if (length(a) ~= 3) || (length(b) ~= 3)
    error('Invalid argument vector length.')
end

az = [a(1), b(1)];
el = [a(2), b(2)];
r = [a(3), b(3)];

[x, y, z] = sph2cart(az, el, r);
vec = horzcat(x',y',z');

C = acos(dot(vec(1,:), vec(2,:))); 

end