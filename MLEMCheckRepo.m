function [FoundSystemMatrix] = MLEMCheckRepo(RunParameters,MaskParameters,PolimiParameters,Build)

% Load MLEM Repository Index File
        load(fullfile(RunParameters.MLEMRepoLocation,'MLEMIndex.mat'));
        
    % Compare column by column values to see if any of the prebuilt data matches current simulation specifications
                                % Compared Values:  MaskParameters.Ac
                                %                   MaskParameters.MaskThickness                               
                                %                   MaskParameters.MaskDensity   
                                %                   MaskParameters.MaskPlane    
                                %                   MaskParameters.MasktoDetector
                                %                   MaskParameters.MaskElementSizeY
                                %                   MaskParameters.MaskElementSizeZ
                                %
                                %                   Detector(All)
                                %   
                                %                   Build.MaskOuterEdge
                                %                       MaskParameters.MaskOuterEdge(All)
                                %
                                %                   MLEM.NPS
                                %                   MLEM.nImageEdgePixels
                                %
                                %                   PolimiParameters.RotationAngles
                                %
                                % If any of these values differ then the MLEM reconstruction is not valid
            
            SimIndex = sparse(100000,1);            
 
                                
    % Build SimIndex - List of Paramters that may influence MLEM reconstruction

            SimIndex(2,1) = MaskParameters.MaskThickness;
            SimIndex(3,1) = MaskParameters.MaskDensity;   
            SimIndex(4,1) = MaskParameters.MaskPlane;    

            SimIndex(6,1) = MaskParameters.MaskEdgeLength; %(Width)
            SimIndex(7,1) = MaskParameters.MaskEdgeLength; %(Height)
            
            SimIndex(8,1) = PolimiParameters.SourceDistance;

            SimIndex(10,1) = PolimiParameters.SourcePlaneLength; %(Width)
            SimIndex(11,1) = PolimiParameters.SourcePlaneLength; %(Height)
            SimIndex(12,1) = PolimiParameters.ScintillatorThickness; 
            SimIndex(13,1) = PolimiParameters.ScintillatorPixelNumber; %(Width)
            SimIndex(14,1) = PolimiParameters.ScintillatorPixelNumber; %(Height)

            if Build.MaskOuterEdge == 1
                SimIndex(15,1) = MaskParameters.MaskOuterEdge.LengthLeft;
                SimIndex(16,1) = MaskParameters.MaskOuterEdge.LengthRight;
                SimIndex(17,1) = MaskParameters.MaskOuterEdge.LengthTop;
                SimIndex(18,1) = MaskParameters.MaskOuterEdge.LengthBottom;  
            else
                SimIndex(15,1) = 0;
                SimIndex(16,1) = 0;
                SimIndex(17,1) = 0;
                SimIndex(18,1) = 0;
            end
            
            SimIndex(19,1) = PolimiParameters.NPS;
            SimIndex(20,1) = PolimiParameters.SourcePixelNumber;
            

            
            
            SimIndex(100:size(MaskParameters.Ac,1)*size(MaskParameters.Ac,2)+99,1) = MaskParameters.Ac(:);
            
    % Compare SimIndex to all known MLEM Repositories
    
            [~,FoundSystemMatrix] = ismember(SimIndex',MLEMIndex','rows');
     





end