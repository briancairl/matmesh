% MESHVIEW
%
%   Displays a mesh and normalizes plotting axes
function h = meshview(M,varargin)
    if numel(varargin)
        h = patch('Faces',M.E(2:end,:).','Vertices',M.V.',varargin{:});
    else
        h = patch('Faces',M.E(2:end,:).','Vertices',M.V.','FaceColor','b');
    end
    axis equal
end