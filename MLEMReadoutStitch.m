function MLEMReadoutStitch(MLEM,RunParameters)

load(fullfile(pwd,['Readout' num2str(1) '.mat']),'Readout');

SystemMatrix = safe_zeros(MLEM.nSims,size(Readout,1)*size(Readout,2));

for iSims = 1:MLEM.nSims
    
    load(fullfile(pwd,['Readout' num2str(iSims) '.mat']),'Readout');

    % Normalize each row
       % Readout = Readout/max(max(Readout));
    
    SystemMatrix(iSims,1:end) = reshape(Readout,1,[]);
    

end


% Normalize Matrix

 SystemMatrix = SystemMatrix/max(max(SystemMatrix));

save(fullfile(RunParameters.MLEMRepoLocation,['SystemMatrix' num2str(MLEM.nNewSystemMatrix) '.mat']),'SystemMatrix');



end