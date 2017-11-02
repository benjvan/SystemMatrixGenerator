function PolimiManager(RunParameters,PolimiParameters,MaskParameters,Build)

%% Make determination if suitable MLEM reconstruction matrix already exists




    [FoundSystemMatrix] = MLEMCheckRepo(RunParameters,MaskParameters,PolimiParameters,Build);                           


% If no match is found begin monte carlo estimations for MLEM system matrix and save MLEM values in MLEM Index

if FoundSystemMatrix == 0 





    % Find out how many other system matricies have been built previously
     load(fullfile(RunParameters.MLEMRepoLocation,'MLEMIndex.mat'));


     MLEM.nNewSystemMatrix = size(MLEMIndex,2)+1;


     % Create a new folder within the MLEM repository for files associated with generationg the new system matrix

        if ~exist([RunParameters.MLEMRepoLocation '\MLEM' num2str(MLEM.nNewSystemMatrix)], 'dir')
            % Folder does not exist so create it.
            mkdir([RunParameters.MLEMRepoLocation '\MLEM' num2str(MLEM.nNewSystemMatrix)]);
        end

        cd([RunParameters.MLEMRepoLocation '\MLEM' num2str(MLEM.nNewSystemMatrix)]);



        addpath(RunParameters.Location);



     % Calculate number of MLEM Sims

        MLEM.nSims = PolimiParameters.SourcePixelNumber^2;

     % Generate Filenames for all image positions

        [FileNames] = MLEMNameFiles(MLEM);

     % Compile source locations for monte carlo simulations

        [SystemMatrix] = MLEMImagePlanePosition(PolimiParameters,MLEM);

        % Generate MCNP input files for all positions

        for iSims = 1:MLEM.nSims

        % Clear simulation space of all objects other than detector, mask, and mask edge 

            [MaskParameters,PolimiParameters] = MLEMSurfaceCard(MaskParameters,PolimiParameters,FileNames,Build,iSims);

            [MaskParameters,PolimiParameters] = MLEMCellCard(MaskParameters,PolimiParameters,FileNames,Build,iSims);

        % Iterate source position in Polimi Data Card file

            MLEMDataCard(PolimiParameters,FileNames,SystemMatrix,iSims);

        % Stitch Files together into input file

            MLEMInputFileCreation(FileNames,iSims);


        end

     % Setup loop for monte carlo simulatios of system matrix

        fprintf('Beginning %d MLEM Simulations\n',MLEM.nSims);

        parfor iSims = 1:MLEM.nSims

            % Check for existance of completed simulation at each point in space
             if exist(fullfile(pwd,[num2str(iSims) 'MLEMSiPMPositionImageMatrix.mat']),'file') == 2

             else

                 % Run Polimi
                     MLEMPolimiRun(FileNames,iSims);

             end

            % Clean up excess polimi files

                 MLEMCleanUp(FileNames,iSims);

        end

     % Extract Polimi Data into System Matrix


         % Extract data from Polimi dump file

                parfor iSims = 1:MLEM.nSims

                    MLEMDumpExtraction(FileNames,iSims);

                end
                    fprintf('Data gathered from Polimi dump files.\n')


         % Sort interaction listings 

                parfor iSims = 1:MLEM.nSims

                     MLEMDumpParticleSort(iSims);

                end
                     fprintf('Listings sorted from Polimi dump files.\n')



         % Extract only gamma interaction position and energy matrix  

                parfor iSims = 1:MLEM.nSims

                     MLEMDumpInteractions(iSims);

                end


         % Calculate position by energy centroid   

                parfor iSims = 1:MLEM.nSims

                    MLEMWeightByEnergyCentroid(iSims);

                end


          % Grid into Readout pixels

                parfor iSims = 1:MLEM.nSims

                     MLEMGridReadout(Detector,iSims);

                end

          % Stitch Readout Matricies together into System Matrix

                MLEMReadoutStitch(Detector,MLEM,RunParameters);


           % Remove extra folder with System Matrix computational data

               fclose('all');

               cd(RunParameters.MLEMRepoLocation);

           %    rmdir([RunParameters.MLEMRepoLocation '\MLEM' num2str(MLEM.nNewSystemMatrix)],'s');






    % Add information to MLEM Repo Index for newly created system matrix


        % Build SimIndex - List of Paramters that may influence MLEM reconstruction

        SimIndex = sparse(100000,1);

                    SimIndex(2,1) = MaskParameters.MaskThickness;
                    SimIndex(3,1) = MaskParameters.MaskDensity;   
                    SimIndex(4,1) = MaskParameters.MaskPlane;    
                    SimIndex(5,1) = MaskParameters.MasktoDetector;
                    SimIndex(6,1) = MaskParameters.MaskElementSizeY;
                    SimIndex(7,1) = MaskParameters.MaskElementSizeZ;

                    SimIndex(8,1) = Detector.SourceDistance;
                    SimIndex(9,1) = Detector.Offset;
                    SimIndex(10,1) = Detector.Width;
                    SimIndex(11,1) = Detector.Height;
                    SimIndex(12,1) = Detector.Depth; 
                    SimIndex(13,1) = Detector.nVerticalElements;
                    SimIndex(14,1) = Detector.nHorizontalElements;

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

                    SimIndex(19,1) = MLEM.NPS;
                    SimIndex(20,1) = MLEM.nImageEdgePixels;

                    SimIndex(21,1) = PolimiParameters.RotationAngles(iAngles);

                    SimIndex(100:size(MaskParameters.Ac,1)*size(MaskParameters.Ac,2)+99,1) = MaskParameters.Ac(:);


                    % Assign SimIndex into new column of MLEMIndex

                    MLEMIndex(:,MLEM.nNewSystemMatrix) = SimIndex;

                    save(fullfile(RunParameters.MLEMRepoLocation,'MLEMIndex.mat'),'MLEMIndex');

                    
else
    
    fprintf('System Matrix with same specifications already found. Repo #%d /n', FoundSystemMatrix);
    
end


end