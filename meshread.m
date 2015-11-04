function M = meshread(filename)
    
    % Open mesh source file
    fid = fopen(filename,'r');
    
    % Create an empty mesh struct
    M.V = [];
    M.E = [];
    
    if fid > 0
        
        % Parse away the file header
        header = fgets(fid,3);
        
        % Check that the file is '.OFF'
        if  strcmpi(header,'OFF')
            line        = fscanf(fid,'%d');
            n_verts     = line(1);
            n_edges     = line(2);
            M.V         = fscanf(fid,'%f',[3,n_verts]);
            M.E     	= fscanf(fid,'%d',[4,n_edges]) + 1;
        else
            warning(['Incompatible file : ',filename]); 
        end
        fclose(fid);
    else
       warning(['No file : ',filename]); 
    end
end