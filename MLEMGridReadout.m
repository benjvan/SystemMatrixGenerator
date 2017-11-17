function MLEMGridReadout(PolimiParameters,iSims)
if exist(fullfile(pwd,['EnergyCentroid' num2str(iSims) '.mat']),'file' )
    load(fullfile(pwd,['EnergyCentroid' num2str(iSims) '.mat']),'GammaInteractionData');

    % Create Mask Image
    PolimiParameters.DetectorYMin = -PolimiParameters.ScintillatorPlaneLength/2+PolimiParameters.DetectorShiftX;
    PolimiParameters.DetectorYMax =PolimiParameters.ScintillatorPlaneLength/2+PolimiParameters.DetectorShiftX;
    PolimiParameters.DetectorZMin = -PolimiParameters.ScintillatorPlaneLength/2+PolimiParameters.DetectorShiftY;
    PolimiParameters.DetectorZMax = PolimiParameters.ScintillatorPlaneLength/2+PolimiParameters.DetectorShiftY;
%     PolimiParameters.totalDetectorlengthY = PolimiParameters.ScintillatorPlaneLength;
%     PolimiParameters.totalDetectorlengthZ = PolimiParameters.ScintillatorPlaneLength;
     PolimiParameters.DetectorElementSizeY = PolimiParameters.totalDetectorlengthY/PolimiParameters.ScintillatorPixelNumber;
     PolimiParameters.DetectorElementSizeZ = PolimiParameters.totalDetectorlengthZ/PolimiParameters.ScintillatorPixelNumber;
%     offy = PolimiParameters.totalDetectorlengthY/2-PolimiParameters.DetectorShiftX; 
%     offz = -PolimiParameters.totalDetectorlengthZ/2-PolimiParameters.DetectorShiftY;
% 
%     Centers{1} = -linspace(offy+PolimiParameters.DetectorElementSizeY/2,-offy-PolimiParameters.DetectorElementSizeY/2,PolimiParameters.ScintillatorPixelNumber);
%     Centers{2} = -linspace(offy+PolimiParameters.DetectorElementSizeZ/2,-offy-PolimiParameters.DetectorElementSizeZ/2,PolimiParameters.ScintillatorPixelNumber);

    Centers{1} = linspace( PolimiParameters.DetectorYMin+PolimiParameters.DetectorElementSizeY/2, PolimiParameters.DetectorYMax-PolimiParameters.DetectorElementSizeY/2,PolimiParameters.ScintillatorPixelNumber);
    Centers{2} = linspace( PolimiParameters.DetectorZMin+PolimiParameters.DetectorElementSizeZ/2, PolimiParameters.DetectorZMax-PolimiParameters.DetectorElementSizeZ/2,PolimiParameters.ScintillatorPixelNumber);

    
    fprintf('%s ',Centers{1})
    MaskImageMatrix = [GammaInteractionData.MaskEnergyWeightedCentroids(:,2),GammaInteractionData.MaskEnergyWeightedCentroids(:,3)];
    Readout = hist3(MaskImageMatrix,Centers);
    % Readout = hist3(MaskImageMatrix,[Detector.nVerticalElements,Detector.nHorizontalElements]);

    save(fullfile(pwd,['Readout' num2str(iSims) '.mat']),'Readout');

end

    


end


