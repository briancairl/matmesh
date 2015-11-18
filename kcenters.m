% KCENTERS(D, k)
%   
% Source : http://sites.stat.psu.edu/~jiali/course/stat597e/notes2/kcenter.pdf 
%
%
function ids = kcenters( D, k, varargin )
    
    % Init seed
    [N,dist] = procInit(D,varargin);
    
    % Init ids
    ids     = ones(1,k);
    avail   = ones(1,N);
    
    % Assign the remainder of the IDs
    for kdx = 2:k
        [dl,idx]    = max(dist.*avail,[],2);
        leq         = D(idx,:) < dl;
        dist(leq)   = D(idx,leq);
        ids(leq)    = kdx;
    end
    
end
function [ N, dist ] = procInit(D,argv)
    
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
    
