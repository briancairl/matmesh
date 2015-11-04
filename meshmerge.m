% MESHMERGE
%
%   Generates a single mesh (M) from a pair of meshes (M1,M2)
function M = meshmerge(M1,M2)
    M.V = [ M1.V, M2.V ];
    M.E = [ M1.E, M2.E + size(M1.V,2); ];
end