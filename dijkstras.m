% [L,p] = DIJKSTRAS(G,b) 
%
% Computes the shortest path from a starting node to all other nodes.
%
% Input:
%   G       an adjacency graph (N x N)
%   b       starting node index
%
% Output:
%   L       length of path to each node from 'b'
%   p       pathing information (use 'RECOVER_PATH' to generate node-to-node path)
%
function [L,p,pn] = dijkstras(G,b)
    
    N       = size(G,2);
    O       = ones(1,N);
    L       = ones(1,N)*inf;
    p       = zeros(1,N);
    pn      = ones(1,N);
    
    V       = boolean(zeros(1,N));
    
    % Set initial node to disttance of 0
    L(b)    = 0;
    pn(b)   = 0;
    V(b)    = true;
    eval    = zeros(1,N);
    
    
    % Stop when nothings on the open list
    while nnz(V)
        
        % set as visited
        eval(V)         = L(V);
        eval(~V)        = inf;
        [~,mb]          = min( eval );
        O(mb)           = 0;
        V(mb)           = 0;
        
        % get neighbors
        edges           = find( (G(mb,:)~=inf ) & O );
        Lp              = L(mb) + G(mb,edges);
        qualified       = (Lp < L(edges));
        p_edges         = edges(qualified);
        L(p_edges)      = Lp(qualified);
        
        % add to open list
        V(p_edges)      = 1;
        
        % granted paths
        pn(p_edges)     = 0;
        if nargout>=2
            p(p_edges)  = mb;
        end
        
    end
end