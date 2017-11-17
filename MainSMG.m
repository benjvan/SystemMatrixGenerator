% Standalone System Matrix Generator
% Mura Masks - Monte Carlo
% Ben Van
% 9/26/2017


clear all
close all
clc


% Declare Folder Location and name files

    RunParameters.Location = 'C:\Galt\SystemMatrixManufacturedCenters'; % FolderLocation for all files associated with the simulation being generated 
    
    % Check if location already exists
    if ~exist(RunParameters.Location, 'dir')
        % Folder does not exist so create it.
        mkdir(RunParameters.Location);
    end

    addpath('C:\Galt\SystemMatrixGenerator');
    cd(RunParameters.Location);
    
    % Name for simulation  
    RunParameters.SimulationName = '2m_662_11_DetShifted_try2'; 
    

    % Declare MLEM Repo Location
    RunParameters.MLEMRepoLocation = 'C:\Galt\MLEMRepoManufactured';

    
    
    
% Set Simulation Parameters


    % Source Energy (MeV)
    PolimiParameters.SourceEnergy = 0.663;

    % Source Plane Distance (From front of SiPM) (cm)
    PolimiParameters.SourceDistance = 200;
    
    % Source Plane Edge Length (including PCFOV)(255.4204)
    PolimiParameters.SourcePlaneLength = 200;
    
    % Source Plane Pixels per Edge (including PCFOV)(123)
    PolimiParameters.SourcePixelNumber = 50;
    
    
    
    
    
    % Scintillator Plane Edge Length 
    PolimiParameters.ScintillatorPlaneLength = 5.02;
    
    % Scintillator Number of Pixels on each edge
    PolimiParameters.ScintillatorPixelNumber = 12;
    
    % Scintillator Thickness
    PolimiParameters.ScintillatorThickness = 2;
    
    % Scintillator Material
    PolimiParameters.ScintillatorMaterial = 1;                  %1 = CsI
                                                                %2 = NaI
                                                                %3 = LaBr3
      
    % Detector Shift 
    PolimiParameters.DetectorShiftX = -0.42; % Shifts detector laterally 
                                            % Normally 0
    PolimiParameters.DetectorShiftY = -0.42; % Shifts detector vertically                                                           
                                            % Normally 0                   
                                                                
                                                                
                                                                
    % Mask Pattern
    MaskParameters.Pattern = 1; % 1 = MURA         [3,7,11,19,23,31,43,47,59,67,71,79,83]
     
    % Mask Sequence Length 
    MaskParameters.MaskSequenceLength = 11; 
    
    % Mask Thickness (cm)
    MaskParameters.MaskThickness = 2;                                                        
    
    % Mask Density (Ususally 19.3 for tungsten (default))
    MaskParameters.MaskDensity = 19.30;
    
    % Mask Distance from front edge of Scintillator (cm)
    MaskParameters.MaskPlane =  2.268;

    % Mask Size (Total Edge to Edge inculding mosaiced sections) (cm)
    MaskParameters.MaskEdgeLength = 8.6205;                                           
        
    % Mosaic Mask
    MaskParameters.MosaicMuraMask = 1; % Takes the n x n mask and mosaics it into a (2*n-1) x (2*n-1) mask


    % Universe
    % XYZ Exterior Dimensions
        PolimiParameters.UniverseBoarderYMin = -PolimiParameters.SourcePlaneLength/2-PolimiParameters.SourcePlaneLength/2*0.25;
        PolimiParameters.UniverseBoarderYMax = PolimiParameters.SourcePlaneLength/2+PolimiParameters.SourcePlaneLength/2*0.25;
        PolimiParameters.UniverseBoarderZMin = -PolimiParameters.SourcePlaneLength/2-PolimiParameters.SourcePlaneLength/2*0.25;
        PolimiParameters.UniverseBoarderZMax = PolimiParameters.SourcePlaneLength/2+PolimiParameters.SourcePlaneLength/2*0.25;
        PolimiParameters.UniverseBoarderXMin = -10;
        PolimiParameters.UniverseBoarderXMax = PolimiParameters.SourceDistance+PolimiParameters.SourceDistance*0.1;                                                                
                                                                

    
    % Build Mask Outer Edge
    Build.MaskOuterEdge = 1; % Material blocking all side rays from mask edges                                                           

    
    MaskParameters.MaskOuterEdge.LengthLeft = PolimiParameters.UniverseBoarderYMin-MaskParameters.MaskEdgeLength/2; % Length of material blocking all side rays from mask edges
    MaskParameters.MaskOuterEdge.LengthRight = PolimiParameters.UniverseBoarderYMax-MaskParameters.MaskEdgeLength/2;
    MaskParameters.MaskOuterEdge.LengthTop = PolimiParameters.UniverseBoarderZMax-MaskParameters.MaskEdgeLength/2;
    MaskParameters.MaskOuterEdge.LengthBottom = PolimiParameters.UniverseBoarderZMin-MaskParameters.MaskEdgeLength/2;  

    MaskParameters.MaskOuterEdge.LeadThickness = MaskParameters.MaskThickness;
    
    
    
    
                                                                
    % Simulation NPS
    PolimiParameters.NPS = 5*10^7;
                                                                
    %%
         
        % Create all Mask Designs
        tic;
        [MaskParameters] = MaskCreation(MaskParameters);
        t=toc;
        fprintf('Mask Files Created.\n Time taken %d.\n',t)
                                                                
        
        % Plot Mask Design
        figure(1); clf(1); 
        imagesc(MaskParameters.Ac)
        colormap(flipud(colormap));
                
        
        % Save Variables to file
        MCNPVariableFile = fullfile(pwd,[RunParameters.SimulationName 'MCNPVariables.mat']);
        save(MCNPVariableFile)
        fprintf('MCNP variables saved.\n')

        
%% Run Simulation
        % Run Polimi Simulations
        tic;
        PolimiManager(RunParameters,PolimiParameters,MaskParameters,Build);
        t = toc;
        fprintf('Simulation set run.\n Time taken %d.\n',t);
        
        
        
        