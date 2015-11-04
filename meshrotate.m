% MESHROTATE
%
%   Rotates a mesh some angle about an axis. 
function R = meshrotate(M,axa,varargin)

    coff_mode  = false;
    while numel(varargin)
        if  strcmpi( varargin{1}, 'CENTROIDAL' )
            coff_mode = strcmpi( varargin{2}, 'ON' );
        else
            error(sprintf('Unrecognized option : %s\n',varargin{1})); %#ok<SPERR>
        end
        varargin(1:2) = [];
    end

    l2m  = norm( axa(1:3) );
    R    = M;
    if l2m > 0
        axa(1:3)    = axa(1:3)/l2m;
        if coff_mode
            cen     = repmat( mean(M.V,2), 1, size(M.V,2) );
            R.V     = vrrotvec2mat(axa)*( M.V - cen ) + cen;
        else
            R.V     = vrrotvec2mat(axa)*M.V;
        end
    else
        warning('Invalid axis about which to rotate');
    end
end