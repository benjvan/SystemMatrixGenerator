function MLEMDumpExtraction(FileNames,iSims)


% Read in interaction data from Polimi dump file for the mask
fid = fopen(FileNames.DUMN1{iSims});

Dumn1Data = reshape(fscanf(fid, '%f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f\n'),16,[])';

fclose(fid);


% Save variable to file

save(fullfile(pwd,['Dumn1Data' num2str(iSims) '.mat']),'Dumn1Data');

end






