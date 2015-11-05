% N = FACES2NORMALS(M)
%
% Coverts all triangular mesh faces to point-normal-vector (6 x 1) represention
function N = faces2normals(M)
    
    m           = size(M.E,2);
    N           = zeros(6,m);
    Va          = M.V(:,M.E(2,:)) - M.V(:,M.E(3,:));
    Vb          = M.V(:,M.E(4,:)) - M.V(:,M.E(3,:));
    N(1:3,:)    = (M.V(:,M.E(2,:)) + M.V(:,M.E(3,:)) + M.V(:,M.E(4,:)))/3;
    N(4:6,:)    = cross(Vb,Va);
    N(4:6,:)    = N(4:6,:)./repmat( sqrt( sum( N(4:6,:).^2 , 1 ) ), 3, 1 );

end