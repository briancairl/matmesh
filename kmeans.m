% KMEAN(D, k)
%   
%
%
function [ids,centers] = kmeans( V, D, k, varargin )
    
    % Init/seed
    [N,idx]     = procInit(D,k,varargin);
    ids         = zeros(1,N);
    
    % Init Centers
    centers     = V(:,idx);
    centers_s   = centers;
    n_itr       = 1;
    assoc       = idx;
    ids(idx)    = 1:k;
    
    % Init ids
    while any(~boolean(ids))
        n_itr       = n_itr + 1;
        [mins,kdx]  = min(D(assoc,:)+repmat(large(ids),k,1),[],2);
        ids(kdx)    = 1:k;
        centers_s   = centers_s + V(:,kdx);
        centers     = centers_s/n_itr; 
        assoc       = knnsearch( V.', centers.', 'K', 1);
    end
    
end
function [ N, idx ] = procInit(D,k,argv)
    
    N   = size(D,2);
    idx = unique_randi([1,N],1,k);

    % Variable arguments
end
function idx = unique_randi(R,i,j)
    idx = zeros(i,j);
    for kdx = 1:(i*j)
        r = 0;
        while any(r==idx)
            r = randi(R,1,1);
        end
        idx(kdx) = r;
    end
end
function L = large(b)
    b       = boolean(b);
    L       = zeros(size(b));
    L(b)    = inf;
end