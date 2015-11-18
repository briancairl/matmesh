% KCENTERS(D, k)
%   
% Source : http://sites.stat.psu.edu/~jiali/course/stat597e/notes2/kcenter.pdf 
%
%
function ids = kcenters( D, k, varargin )
    
    % Init seed
    [N,idx,dist]= procInit(D,varargin);
    
    % Init ids
    ids         = ones(1,N);
    avail       = ones(1,N);
    avail(idx)  = 0;
    
    % Assign the remainder of the IDs
    for kdx = 2:k
        [dl,idx]    = max(dist.*avail);
        leq         = ( D(idx,:) <= dist ) & ( boolean(avail) );
        dist(leq)   = D(idx,leq);
        ids(leq)    = kdx;
        avail(idx)  = 0;
    end
    
end
function [ N, idx, dist ] = procInit(D,argv)
    
    N   = size(D,2);
    idx = randi([1,N],1,1);

    % Variable arguments
    while numel(argv)
        if strcmpi(argv{1},'SEED')
           idx = argv{2}(1,1); 
        end
        argv(1:2) = [];
    end
    
    % Initial distances
    dist = D(idx,:);
end
    
