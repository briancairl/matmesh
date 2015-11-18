function [D,G] = geod(M,varargin)
    
    v = procInit(varargin);
    
    G = mesh2graph(M,2);
    S = sparse(G);
    D = zeros(size(G));
    
    parfor idx = 1:size(G,2)
        
       D(idx,:) = graphshortestpath(S,idx);
       
       if v
           fprintf('Progress: %f %%\n',100*idx/size(G,2));
       end
    end
    
end
function [v] = procInit(argv)
    v = false;
    while numel(argv)
        if  strcmpi(argv{1},'-V') || strcmpi(argv{1},'VERBOSE')
            v = true;
            argv(1) = [];
        end
       
    end
end
