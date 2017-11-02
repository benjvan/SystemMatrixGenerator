function MLEMGridReadout(Detector,iSims)

load(fullfile(pwd,['EnergyCentroid' num2str(iSims) '.mat']),'GammaInteractionData');

% Create Mask Image

Centers{1} = Detector.BinCentersVertical;
Centers{2} = Detector.BinCentersHorizontal;


MaskImageMatrix = [GammaInteractionData.MaskEnergyWeightedCentroids(:,2),GammaInteractionData.MaskEnergyWeightedCentroids(:,3)];
Readout = hist3(MaskImageMatrix,Centers);
% Readout = hist3(MaskImageMatrix,[Detector.nVerticalElements,Detector.nHorizontalElements]);





save(fullfile(pwd,['Readout' num2str(iSims) '.mat']),'Readout');

end


