% [G,D] = MESH2GRAPH(M,p)
%  
% Generates an N x N weighted adjacency matrix from a mesh structures with
% elements, where N is the number of vertexs in mesh M
%
% Inputs:
%   M   mesh
%   p   Lp norm order
%
% Outputs:
%   G   adjacency matrix with edge weights (Lp distances)
%
function G = mesh2graph(M,p)

    G = ones( size(M.V,2) )*inf; 
    for idx = 1:size(M.E,2)
        edges = [M.E(2:end,idx).',M.E(2,idx)];
        for jdx = 2:M.E(1)
            a = edges(1,jdx);
            b = edges(1,jdx-1);
            if  G(a,b)==inf
                d       = norm( M.V(:,a) - M.V(:,b), p );
                G(a,b)  = d;
                G(b,a)  = d;
            end
        end
    end
end