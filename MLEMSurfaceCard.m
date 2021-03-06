function [MaskParameters,PolimiParameters] = MLEMSurfaceCard(MaskParameters,PolimiParameters,FileNames,Build,iSims)

f1 = fopen(FileNames.SurfaceCard{iSims},'w');


% Determine mask lengths
    MaskParameters.totalmasklengthY = MaskParameters.MaskEdgeLength;
    MaskParameters.totalmasklengthZ = MaskParameters.MaskEdgeLength;



%Start writing surfaces
PolimiParameters.surfacestart = 100;
surface = 100;


fprintf(f1,'c ************************** Surface definition cards **************************\nc RPP: Rectangular Parallelepiped, surfaces normal to major axes, x,y,z values relative to origin.\nc RPP Xmin Xmax Ymin Ymax Zmin Zmax\nc \nc\n');

fprintf(f1,'%d PX %5.20f \n',surface,MaskParameters.MaskPlane);
PolimiParameters.SurfaceRepoX(surface,1) = surface;
PolimiParameters.SurfaceRepoX(surface,2) = MaskParameters.MaskPlane;
surface = surface + 1;
fprintf(f1,'%d PX %5.20f \n',surface,MaskParameters.MaskPlane+MaskParameters.MaskThickness);
PolimiParameters.SurfaceRepoX(surface,1) = surface;
PolimiParameters.SurfaceRepoX(surface,2) = MaskParameters.MaskPlane+MaskParameters.MaskThickness;
surface = surface + 1;


% Define y,z planes.
k=0;
l=surface;
offy = -MaskParameters.totalmasklengthY/2; 
offz = -MaskParameters.totalmasklengthZ/2;  % lower left corner

y1 = offy;
z1 = offz;


MaskParameters.MaskElementSizeY = MaskParameters.totalmasklengthY/length(MaskParameters.Ac);
MaskParameters.MaskElementSizeZ = MaskParameters.totalmasklengthY/length(MaskParameters.Ac);


while k <= length(MaskParameters.Ac)
    
    if y1 < offy + MaskParameters.totalmasklengthY
        
        y1 = offy + k*MaskParameters.MaskElementSizeY;
        fprintf(f1,'%d PY %5.20f \n',surface,y1);
        PolimiParameters.SurfaceRepoY(l,1) = surface;
        PolimiParameters.SurfaceRepoY(l,2) = y1;
        PolimiParameters.LastYSurface = surface;
        surface = surface + 1;
        
    end
    
    if z1 < offz + MaskParameters.totalmasklengthZ
        
        z1 = offz + k*MaskParameters.MaskElementSizeZ;
        fprintf(f1,'%d PZ %5.20f \n',surface,z1);
        PolimiParameters.SurfaceRepoZ(l+1,1) = surface;
        PolimiParameters.SurfaceRepoZ(l+1,2) = z1;
        PolimiParameters.LastZSurface = surface;
        surface = surface + 1;
    end
    
    k= k+1;
    l=l+2;
end



PolimiParameters.MaskEndSurface = surface-1;


if Build.MaskOuterEdge == 1

    % Build Mask surround boarder surfaces

    PolimiParameters.TrueMaskEdgeYBelow =  offy - MaskParameters.MaskOuterEdge.LengthBottom;
    PolimiParameters.TrueMaskEdgeYAbove =  offy + MaskParameters.MaskOuterEdge.LengthTop + MaskParameters.totalmasklengthY;
    PolimiParameters.TrueMaskEdgeZBelow =  offz - MaskParameters.MaskOuterEdge.LengthRight;
    PolimiParameters.TrueMaskEdgeZAbove =  offz + MaskParameters.MaskOuterEdge.LengthLeft + MaskParameters.totalmasklengthZ;


    PolimiParameters.MaskBoarderYBelow = surface;
    fprintf(f1,'%d PY %5.20f \n',surface,PolimiParameters.TrueMaskEdgeYBelow);
    PolimiParameters.SurfaceRepoEdge(l,1) = surface;
    PolimiParameters.SurfaceRepoEdge(l,2) = PolimiParameters.TrueMaskEdgeYBelow;
    surface = surface + 1;

    PolimiParameters.MaskBoarderYAbove = surface;
    fprintf(f1,'%d PY %5.20f \n',surface,PolimiParameters.TrueMaskEdgeYAbove);
    PolimiParameters.SurfaceRepoEdge(l,1) = surface;
    PolimiParameters.SurfaceRepoEdge(l,2) = PolimiParameters.TrueMaskEdgeYAbove;
    surface = surface + 1;

    PolimiParameters.MaskBoarderZBelow = surface;
    fprintf(f1,'%d PZ %5.20f \n',surface,PolimiParameters.TrueMaskEdgeZBelow);
    PolimiParameters.SurfaceRepoEdge(l,1) = surface;
    PolimiParameters.SurfaceRepoEdge(l,2) = PolimiParameters.TrueMaskEdgeZBelow;
    surface = surface + 1;

    PolimiParameters.MaskBoarderZAbove = surface;
    fprintf(f1,'%d PZ %5.20f \n',surface,PolimiParameters.TrueMaskEdgeZAbove);
    PolimiParameters.SurfaceRepoEdge(l,1) = surface;
    PolimiParameters.SurfaceRepoEdge(l,2) = PolimiParameters.TrueMaskEdgeZAbove;
    surface = surface + 1;
    
else
    PolimiParameters.MaskBoarderYBelow=0;
    PolimiParameters.MaskBoarderYAbove=0;
    PolimiParameters.MaskBoarderZBelow=0;
    PolimiParameters.MaskBoarderZAbove=0;

end
   

    PolimiParameters.LatticeHoleHighZSurface = surface;
    
       fprintf(f1,'%d  PZ %5.20f \n',PolimiParameters.LatticeHoleHighZSurface,MaskParameters.MaskElementSizeZ/2);
       
       surface = surface+1;
       PolimiParameters.LatticeHoleLowZSurface = surface;
       
        fprintf(f1,'%d  PZ %5.20f \n',PolimiParameters.LatticeHoleLowZSurface,-MaskParameters.MaskElementSizeZ/2);

       surface = surface+1;
       PolimiParameters.LatticeHoleHighYSurface = surface;


        fprintf(f1,'%d  PY %5.20f \n',PolimiParameters.LatticeHoleHighYSurface,MaskParameters.MaskElementSizeY/2);

       surface = surface+1;
       PolimiParameters.LatticeHoleLowYSurface = surface;
       
        fprintf(f1,'%d  PY %5.20f \n',PolimiParameters.LatticeHoleLowYSurface,-MaskParameters.MaskElementSizeY/2);

       surface = surface+1;
       PolimiParameters.LatticeHoleLowXSurface = surface;

        fprintf(f1,'%d  PX %5.20f \n',PolimiParameters.LatticeHoleLowXSurface,MaskParameters.MaskPlane);

       surface = surface+1;
       PolimiParameters.LatticeHoleHighXSurface = surface;
       
        fprintf(f1,'%d  PX %5.20f \n',PolimiParameters.LatticeHoleHighXSurface,MaskParameters.MaskPlane+MaskParameters.MaskThickness);
    
       surface = surface+1;
       PolimiParameters.MaskEdgeHighZSurface = surface;
       
       fprintf(f1,'%d  PZ %5.20f \n',surface,MaskParameters.totalmasklengthZ/2);
       
       surface = surface+1;
       PolimiParameters.MaskEdgeLowZSurface = surface;
       
       fprintf(f1,'%d  PZ %5.20f \n',surface,-MaskParameters.totalmasklengthZ/2);
       
       surface = surface+1;
       PolimiParameters.MaskEdgeHighYSurface = surface;
       
       fprintf(f1,'%d  PY %5.20f \n',surface,MaskParameters.totalmasklengthY/2);
       
       surface = surface+1;
       PolimiParameters.MaskEdgeLowYSurface = surface;
       
       fprintf(f1,'%d  PY %5.20f \n',surface,-MaskParameters.totalmasklengthY/2);
       
        



fprintf(f1,'c\n');
fprintf(f1,'c end DT mask surface cards\n');
fprintf(f1,'c\n');
fprintf(f1,'c\n');





% Build Universe surface

fprintf(f1,'c\n');

fprintf(f1,'8001 PY %d\n',PolimiParameters.UniverseBoarderYMin);
fprintf(f1,'8002 PZ %d\n',PolimiParameters.UniverseBoarderZMin);
fprintf(f1,'8003 PY %d\n',PolimiParameters.UniverseBoarderYMax);
fprintf(f1,'8004 PZ %d\n',PolimiParameters.UniverseBoarderZMax);
fprintf(f1,'8005 PX %d\n',PolimiParameters.UniverseBoarderXMin);
fprintf(f1,'8006 PX %d\n',PolimiParameters.UniverseBoarderXMax);

fprintf(f1,'c\n');

          
          





% Build surface cards for Bar Detector array
    surface = 8500;
    PolimiParameters.DetectorSurfaceStart = surface;

    fprintf(f1,'c\n');
    fprintf(f1,'c Begin Detector surface cards\n');
    fprintf(f1,'c\n');
   


    PolimiParameters.DetectorYMin = -PolimiParameters.ScintillatorPlaneLength/2+PolimiParameters.DetectorShiftX;
    PolimiParameters.DetectorYMax =PolimiParameters.ScintillatorPlaneLength/2+PolimiParameters.DetectorShiftX;
    PolimiParameters.DetectorZMin = -PolimiParameters.ScintillatorPlaneLength/2+PolimiParameters.DetectorShiftY;
    PolimiParameters.DetectorZMax = PolimiParameters.ScintillatorPlaneLength/2+PolimiParameters.DetectorShiftY;
    PolimiParameters.DetectorXMin = -PolimiParameters.ScintillatorThickness;
    PolimiParameters.DetectorXMax = 0;

        fprintf(f1, 'c Single Cell Detector (Polimi can only collect interaction data in 100 cells)\n');
        fprintf(f1, '%d RPP %5.4f %5.4f %5.4f %5.4f %5.4f %5.4f\n',PolimiParameters.DetectorSurfaceStart,PolimiParameters.DetectorXMin,PolimiParameters.DetectorXMax,PolimiParameters.DetectorYMin,PolimiParameters.DetectorYMax,PolimiParameters.DetectorZMin,PolimiParameters.DetectorZMax);
        fprintf(f1,'c\n');
        
        PolimiParameters.DetectorSurfaceEnd = surface;


    fprintf(f1,'c\n');
    fprintf(f1,'c End Detector surface cards\n');
    fprintf(f1,'c\n');
    

fprintf(f1,'\n');

fclose(f1);




end