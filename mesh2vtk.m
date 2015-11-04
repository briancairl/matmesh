function mesh2vtk(filename,M,varargin)
    fid     = fopen(filename,'w');
    fval    = [];
    
    while numel(varargin)
       if strcmpi(varargin{1},'F_VALUE')
           fval = varargin{2};
       end
       varargin(1:2) = [];
    end
    
    if fid > 0
        fprintf(fid,'# vtk DataFile Version 3.0\n');
        fprintf(fid,'vtk output\nASCII\nDATASET POLYDATA\n');
        
        fprintf(fid,'POINTS %d float\n',size(M.V,2));
        fprintf(fid,'%g %g %g\n',M.V);
        
        fprintf(fid,'POLYGONS %d %d\n',size(M.E,2),4*size(M.E,2));
        fprintf(fid,'%d %d %d %d\n',(M.E)-1);
        
        fprintf(fid,'\n');
        
        if ~isempty(fval)
            fprintf(fid,'POINT_DATA %d\n',size(M.V,2));
            fprintf(fid,'SCALARS distance_From float\n');
            fprintf(fid,'LOOKUP_TABLE default\n');
            fprintf(fid,'%g\n',fval);
        end
        
        fclose(fid);
    else
        fprintf('Could not write to %s\n',filename);
    end
end