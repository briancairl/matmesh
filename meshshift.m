% MESHSHIFT
%
%   Shifts all vertices of a mesh (M) by a 3-by-1 translation (v)
function M = meshshift(M,v)
    M.V = M.V + repmat(v,1,size(M.V,2));
end