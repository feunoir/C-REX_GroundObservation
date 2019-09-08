function res = AngleBetween2Stars(a, b)

RA1 = hms2rad(a(1,:));
Decl1 = dms2rad(a(2,:));

RA2 = hms2rad(b(1,:));
Decl2 = dms2rad(b(2,:));

A = [RA1 Decl1 1];
B = [RA2 Decl2 1];

res = AngleOfVectors(A,B);

end