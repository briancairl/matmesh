% MESHROTATE
%
%   Rotates a mesh some angle about an axis, or by a standard rotation
%   matrix
function R = meshrotate(M,rot,varargin)
    if numel(rot)==4
        Rot = vrrotvec2mat(rot);
    else
        Rot = rot;
    end
    coff_mode  = false;
    while numel(varargin)
        if  strcmpi( varargin{1}, 'CENTROIDAL' )
            coff_mode = strcmpi( varargin{2}, 'ON' );
        else
            error(sprintf('Unrecognized option : %s\n',varargin{1})); %#ok<SPERR>
        end
        varargin(1:2) = [];
    end

    l2m  = norm( rot(1:3) );
    R    = M;
    if l2m > 0
        rot(1:3)    = rot(1:3)/l2m;
        if coff_mode
            cen     = repmat( mean(M.V,2), 1, size(M.V,2) );
            R.V     = Rot*( M.V - cen ) + cen;
        else
            R.V     = Rot*M.V;
        end
    else
        warning('Invalid axis about which to rotate');
    end
end