% NMESHVIEW
%
%   Displays a mesh with normals and normalizes plotting axes
function N = nmeshview(M,varargin)
    hold on
        meshview(M, varargin{:});
        
        N = faces2normals(M);
        
        quiver3( N(1,:), N(2,:), N(3,:),...
                 N(4,:), N(5,:), N(6,:),...
                 'Color','r');
    hold off
end