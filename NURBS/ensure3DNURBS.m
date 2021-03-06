function nurbs = ensure3DNURBS(nurbs)

for i = 1:numel(nurbs)
    coeffs = nurbs{i}.coeffs;
    d = nurbs{i}.d;
    if ~(d == 3)
        sizes = size(coeffs);
        nurbs{i}.coeffs = cat(1,slc(coeffs,1:d),zeros([3-d,sizes(2:end)]),slc(coeffs,d+1));
        nurbs{i}.d = 3;
    end
end
