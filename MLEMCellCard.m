function [MaskParameters,PolimiParameters] = MLEMCellCard(MaskParameters,PolimiParameters,FileNames,Build,iSims)

% Remove all cells other than detector, mask, mask edge
    Build.Ground = 0;
    Build.HE = 0;



f2 = fopen(FileNames.CellCard{iSims},'w');

% Determine mask lengths
    MaskParameters.totalmasklengthY = MaskParameters.MaskElementSizeY*size(MaskParameters.Ac,1);
    MaskParameters.totalmasklengthZ = MaskParameters.MaskElementSizeZ*size(MaskParameters.Ac,2);

    
PolimiParameters.cellstart =100;
cell = 100;



% Header
    % edit here or in editor

fprintf(f2, 'c MLEM Mask Model\n');
fprintf(f2, 'c 10m distance\n');
fprintf(f2, 'c Single point source at origin\n');
fprintf(f2, 'c 11x11 Tungsten mask 2cm thick (DT), 200cm from detector face\n');
fprintf(f2, 'c 125x125x2cm Bar detector (single unit)\n');
fprintf(f2, 'c\n');
fprintf(f2, 'c Benjamin Van\n');
fprintf(f2, 'c 28June2016\n');
fprintf(f2, 'c\n');
fprintf(f2, 'c\n');
fprintf(f2, 'c\n');

% Build Mask Cells
fprintf(f2,'c\n');
fprintf(f2,'c Begin Mask Cell cards\n');
fprintf(f2,'c\n');


offy = -MaskParameters.totalmasklengthY/2;  offz = -MaskParameters.totalmasklengthZ/2;  % lower left corner
x1 = MaskParameters.MaskPlane;  x2 = MaskParameters.MaskPlane + MaskParameters.MaskThickness;


%     
%     for i = 0:size(MaskParameters.Ac,1)-1
%         for j = 0:size(MaskParameters.Ac,2)-1
%             
%             % then the element is opaque; i.e. filled with Pb
%             % lower left corner = masklength/2
%             y1 = offy + i*MaskParameters.MaskElementSizeY;  y2 = offy + (i+1)*MaskParameters.MaskElementSizeY;
%             z1 = offz + j*MaskParameters.MaskElementSizeZ;  z2 = offz + (j+1)*MaskParameters.MaskElementSizeZ;
%             
%             I1 = find(PolimiParameters.SurfaceRepoY(:,2) == y1);
%             I2 = find(PolimiParameters.SurfaceRepoY(:,2) == y2);
%             I3 = find(PolimiParameters.SurfaceRepoZ(:,2) == z1);
%             I4 = find(PolimiParameters.SurfaceRepoZ(:,2) == z2);
%             I5 = find(PolimiParameters.SurfaceRepoX(:,2) == x1);
%             I6 = find(PolimiParameters.SurfaceRepoX(:,2) == x2);
%             
%             if (MaskParameters.Ac(i+1,j+1) == 0);
%                 
%                 fprintf(f2, '%d 031 -%d %d -%d %d -%d %d -%d \n',cell,MaskParameters.MaskDensity,PolimiParameters.SurfaceRepoX(I5),PolimiParameters.SurfaceRepoX(I6),PolimiParameters.SurfaceRepoY(I1),PolimiParameters.SurfaceRepoY(I2),PolimiParameters.SurfaceRepoZ(I3),PolimiParameters.SurfaceRepoZ(I4));
%                 
%             else
%                 
%                 fprintf(f2, '%d 001 -0.001225 %d -%d %d -%d %d -%d \n',cell,PolimiParameters.SurfaceRepoX(I5),PolimiParameters.SurfaceRepoX(I6),PolimiParameters.SurfaceRepoY(I1),PolimiParameters.SurfaceRepoY(I2),PolimiParameters.SurfaceRepoZ(I3),PolimiParameters.SurfaceRepoZ(I4));
%                 
%             end
%             
%             cell = cell + 1;
%             
%         end % for j
%     end  % for i
%     
%     
%     MaskEndCell = cell - 1;
    
    



    
     fprintf(f2, '%d 0 -%d %d -%d %d -%d %d lat=1 u=2 \n',cell,PolimiParameters.LatticeHoleHighZSurface,PolimiParameters.LatticeHoleLowZSurface,PolimiParameters.LatticeHoleHighYSurface,PolimiParameters.LatticeHoleLowYSurface,PolimiParameters.LatticeHoleHighXSurface,PolimiParameters.LatticeHoleLowXSurface);
 
     fprintf(f2, '     fill = -%d:%d -%d:%d 0:0 \n',(size(MaskParameters.Ac,2)-1)/2,(size(MaskParameters.Ac,2)-1)/2,(size(MaskParameters.Ac,1)-1)/2,(size(MaskParameters.Ac,1)-1)/2);
    
     fprintf(f2,'     ');
     
     for i = 1:size(MaskParameters.Ac,1)
         for j = 1:size(MaskParameters.Ac,2)
             
             if (MaskParameters.Ac(i,j) == 0)
                 
                 fprintf(f2,'%d ',4);
                 
             else
                 fprintf(f2,'%d ',3);
             end
             
             if mod(j,30) == 0
                 fprintf(f2,'\n          ');
             end
             
         end
         
         fprintf(f2,' $ROW %d \n     ',i);
         
     end
     fprintf(f2,' $ End of Lattice\nc \n');
     
     
     cell = cell +1;
     
     fprintf(f2, '%d 031 -%d -%d %d -%d %d -%d %d u=3\n',cell,MaskParameters.MaskDensity,PolimiParameters.LatticeHoleHighZSurface,PolimiParameters.LatticeHoleLowZSurface,PolimiParameters.LatticeHoleHighYSurface,PolimiParameters.LatticeHoleLowYSurface,PolimiParameters.LatticeHoleHighXSurface,PolimiParameters.LatticeHoleLowXSurface);

     cell = cell +1;
     
     fprintf(f2, '%d 001 -0.001225 -%d %d -%d %d -%d %d u=4\n',cell,PolimiParameters.LatticeHoleHighZSurface,PolimiParameters.LatticeHoleLowZSurface,PolimiParameters.LatticeHoleHighYSurface,PolimiParameters.LatticeHoleLowYSurface,PolimiParameters.LatticeHoleHighXSurface,PolimiParameters.LatticeHoleLowXSurface);

     cell = cell +1;
     
     fprintf(f2,'%d 0 %d -%d -%d %d -%d %d fill=2 \n',cell,PolimiParameters.LatticeHoleLowXSurface,PolimiParameters.LatticeHoleHighXSurface,PolimiParameters.MaskEdgeHighZSurface,PolimiParameters.MaskEdgeLowZSurface,PolimiParameters.MaskEdgeHighYSurface,PolimiParameters.MaskEdgeLowYSurface);
    
     cell = cell +1;
    
     
     MaskEndCell = cell - 1;




nBorderCells=0;

if Build.MaskOuterEdge == 1
    BorderCell = cell;

    fprintf(f2,'%d 031 -%d (%d -%d %d -%d %d -%d) (-%d:-%d:%d:%d) \n',BorderCell,MaskParameters.MaskDensity,PolimiParameters.surfacestart,PolimiParameters.surfacestart+1,PolimiParameters.MaskBoarderYBelow,PolimiParameters.MaskBoarderYAbove,PolimiParameters.MaskBoarderZBelow,PolimiParameters.MaskBoarderZAbove,PolimiParameters.surfacestart+2,PolimiParameters.surfacestart+3,PolimiParameters.MaskEndSurface-1,PolimiParameters.MaskEndSurface);

    
%      fprintf(f2, '     *TRCL =(');
%      
%      for k = 1:13
%          fprintf(f2, '%d ',TransformationMatrix(iAngles,k));
%      end
%      
%      fprintf(f2,')\n');
    
    
    nBorderCells = 1;

end



nMaskCells = MaskEndCell - PolimiParameters.cellstart + nBorderCells;


fprintf(f2,'c\n');
fprintf(f2,'c end Mask Cell cards\n');
fprintf(f2,'c\n');


%Build cell cards for Detector array
fprintf(f2,'c\n');
fprintf(f2,'c Begin Detector cell cards\n');
fprintf(f2,'c\n');

PolimiParameters.DetectorCellStart = 85000;

fprintf(f2, '%d 006 -2.3296 -%d\n',PolimiParameters.DetectorCellStart,PolimiParameters.DetectorSurfaceStart);

nDetectorCells = 1;

fprintf(f2,'c\n');
fprintf(f2,'c End Detector cell cards\n');
fprintf(f2,'c\n');




if Build.MaskOuterEdge == 0
    fprintf(f2, 'c Fill remaining universe with air cells\n');
    fprintf(f2,'80003 001 -0.001225 (%d -%d 8001 8002 -8003 -8004) (-%d:-%d:%d:%d) \n',PolimiParameters.surfacestart,PolimiParameters.surfacestart+1,PolimiParameters.surfacestart+2,PolimiParameters.surfacestart+3,PolimiParameters.MaskEndSurface-1,PolimiParameters.MaskEndSurface);
    
    if Build.Ground == 1
        fprintf(f2,'                    (-8011:-8012:8013:8014:-%d:%d) \n',PolimiParameters.surfacestart,PolimiParameters.surfacestart+1);
    end
    
    fprintf(f2,'80002 001 -0.001225 (8001 8002 -8003 -8004 %d -8006)\n',PolimiParameters.surfacestart+1);
    
    for nDetectorSurface = 1:nDetectorCells
        fprintf(f2,'     %d\n',PolimiParameters.DetectorSurfaceStart-1+nDetectorSurface);
    end
    
end

if Build.MaskOuterEdge == 1
    fprintf(f2, 'c Fill remaining universe with air cells\n');
    fprintf(f2,'80003 001 -0.001225 (%d -%d 8001 8002 -8003 -8004) (-%d:%d:-%d:%d) \n',PolimiParameters.surfacestart,PolimiParameters.surfacestart+1,PolimiParameters.MaskBoarderYBelow,PolimiParameters.MaskBoarderYAbove,PolimiParameters.MaskBoarderZBelow,PolimiParameters.MaskBoarderZAbove);
    
    fprintf(f2,'80002 001 -0.001225 (8001 8002 -8003 -8004 -%d 8005)\n',PolimiParameters.surfacestart);
    
    for nDetectorSurface = 1:nDetectorCells
        fprintf(f2,'     %d\n',PolimiParameters.DetectorSurfaceStart-1+nDetectorSurface);
    end
   
        fprintf(f2,'80001 001 -0.001225 (8001 8002 -8003 -8004 -8006 %d)  \n',PolimiParameters.surfacestart+1);
    
end





fprintf(f2,'c\n');
fprintf(f2,'c End air cell cards\n');
fprintf(f2,'c\n');

nAirCells = 3;

% Limit universe size

fprintf(f2,'c\n');
fprintf(f2,'c cell 99999, the volume outside the sphere is not filled (voided)\n');
fprintf(f2,'99999 0 -8001:-8002:8003:8004:-8005:8006\n');
fprintf(f2,'c\n');
fprintf(f2,'c End cell cards\n');
fprintf(f2,'c\n');

fprintf(f2,'\n');

nUniverseCells = 1;

PolimiParameters.nTotalCells = nMaskCells+nDetectorCells+nAirCells+nUniverseCells;

fclose(f2);


end