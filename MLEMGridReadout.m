function MLEMGridReadout(MaskParameters,iSims)

load(fullfile(pwd,['EnergyCentroid' num2str(iSims) '.mat']),'GammaInteractionData');

% Create Mask Image
MaskParameters.MaskElementSizeY = MaskParameters.totalmasklengthY/length(MaskParameters.Ac);
MaskParameters.MaskElementSizeZ = MaskParameters.totalmasklengthY/length(MaskParameters.Ac);
offy = -MaskParameters.totalmasklengthY/2; 
offz = -MaskParameters.totalmasklengthZ/2;

Centers{1} = linspace(offy+MaskParameters.MaskElementSizeY/2,-offy-MaskParameters.MaskElementSizeY/2,length(MaskParameters.Ac));
Centers{2} = linspace(offy+MaskParameters.MaskElementSizeY/2,-offy-MaskParameters.MaskElementSizeY/2,length(MaskParameters.Ac));


MaskImageMatrix = [GammaInteractionData.MaskEnergyWeightedCentroids(:,2),GammaInteractionData.MaskEnergyWeightedCentroids(:,3)];
Readout = hist3(MaskImageMatrix,Centers);
% Readout = hist3(MaskImageMatrix,[Detector.nVerticalElements,Detector.nHorizontalElements]);





save(fullfile(pwd,['Readout' num2str(iSims) '.mat']),'Readout');

end


