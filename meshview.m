% MESHVIEW
%
%   Displays a mesh and normalizes plotting axes
function meshview(M,varargin)
    if numel(varargin)
        patch('Faces',M.E(2:end,:).','Vertices',M.V.',varargin{:})
    else
        patch('Faces',M.E(2:end,:).','Vertices',M.V.','FaceColor','b')
    end
    axis equal
end