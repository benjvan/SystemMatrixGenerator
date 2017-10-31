function MLEMDataCard(PolimiParameters,FileNames,SystemMatrix,iSims)

f4 = fopen(FileNames.DataCard{iSims},'w');



% Materials

fprintf(f4,'c ************************** Data cards ****************************************\n');
fprintf(f4,'c \n');

fprintf(f4,'c ******************************* Material Cards *******************************\n');
fprintf(f4,'c *** Complete Air Model ***\n');
fprintf(f4,'M001 007014.80c 0.75209 $ N-14 (abu. = 99.63 %% ) Air, rho = -0.001225 g/cc \n');
fprintf(f4,'     007015.80c 0.002793 $ N-15 (abu. =0.37 %% ) \n');
fprintf(f4,'     008016.80c 0.23158 $ O-16 (abu. = 99.76 %% ) \n');
fprintf(f4,'c     008017.780c 0.000093 $ O-17 (abu. =0.04 %% ) \n');
fprintf(f4,'c 008018.80c 0.000001 $ O-18 (abu. =0.20 %%, not available) \n');
fprintf(f4,'     18040.80c 0.01288 $ Ar (abu. = 99.600 %% )\n');
fprintf(f4,'     006000.80c 0.000554 $ C (naturally occurring)\n');
fprintf(f4,'c     010020.42c 0.00001265 $ Ne-20 (abu. = 90.48 %%, other tables not available)\n');
fprintf(f4,'c 010021.70c 0.0000003 $ Ne-21 (abu. =0.27 %%)\n');
fprintf(f4,'c 010022.70c 0.00000117 $ Ne-22 (abu. =9.25 %%)\n');
fprintf(f4,'c     002004.70c 0.00000072 $ He-4(abu. = 99.9998 %% = naturally occurring)\n');
fprintf(f4,'c     036084.70c 0.00000188 $ Kr-84 (abu. = 57.0 %%)\n');
fprintf(f4,'c     036086.70c 0.0000006 $ Kr-86 (abu. = 17.3 %%)\n');
fprintf(f4,'c     036082.70c 0.0000004 $ Kr-82 (abu. = 11.6 %%)\n');
fprintf(f4,'c     036083.70c 0.0000004 $ Kr-83 (abu. = 11.5 %%)\n');
fprintf(f4,'c     036080.70c 0.00000007 $ Kr-80 (abu. = 2.25 %%)\n');
fprintf(f4,'c     054000.42c 0.000000396 $ Xe (naturally occurring)\n');
fprintf(f4,'     001001.80c 0.0000002 $ H-1(abu. = 99.985 %%)\n');
fprintf(f4,'     001002.80c 0.00000000003 $ H-2(abu. = 0.015 %%)\n');
fprintf(f4,'c *** Simple Air Model (eliminate small atomic abundances:< 1e-5)\n');
fprintf(f4,'M002 007014 0.75209 $ N-14(abu. = 99.63 %%)Air, rho = -0.001225 g/cc\n');
fprintf(f4,'     007015 0.002793 $ N-15(abu. =0.37 %%)\n');
fprintf(f4,'     008016 0.23158 $ O-16(abu. = 99.76 %%)\n');
fprintf(f4,'     008017 0.000093 $ O-17(abu. =0.04 %%)\n');
fprintf(f4,'c 008018 0.000001$ O-18(abu. =0.20 %%, not available)\n');
fprintf(f4,'     018000 0.01288 $ Ar (naturally occurring)\n');
fprintf(f4,'     006000 0.000554 $ C (naturally occurring)\n');
fprintf(f4,'     010020 0.00001265 $ Ne-20 (abu. = 90.48 %%, other tables not available)\n');
fprintf(f4,'c *** PETN:HE Model #1 (Penthrite: C5 H8 N4 O12, rho = -1.773 g/cc) ***\n');
fprintf(f4,'M003 007014.80c 0.1374 $ N-14(abu. = 99.63 %%)Air, rho = -0.001225 g/cc\n');
fprintf(f4,'     007015.80c 0.00051 $ N-15(abu. =0.37 %%)\n');
fprintf(f4,'     008016.80c 0.4136 $ O-16(abu. = 99.76 %%)\n');
fprintf(f4,'c     008017.80c 0.00017 $ O-17(abu. =0.04 %%)\n');
fprintf(f4,'c 008018.80c 0.00082$ O-18(abu. =0.20 %%, not available)\n');
fprintf(f4,'     006000.80c 0.1724 $ C (naturally occurring)\n');
fprintf(f4,'     001001.80c 0.2759 $ H-1(abu. = 99.985 %%)\n');
fprintf(f4,'     001002.80c 0.00004 $ H-2(abu. = 0.015 %%)\n');
fprintf(f4,'c *** RDX: HE Model #2 (C3 H6 N6 O6, rho = -1.82 g/cc) ***\n');
fprintf(f4,'M004 007014 0.2061 $ N-14(abu. = 99.63 %%)Air, rho = -0.001225 g/cc\n');
fprintf(f4,'     007015 0.00076 $ N-15(abu. =0.37 %%)\n');
fprintf(f4,'     008016 0.2068 $ O-16(abu. = 99.76 %%)\n');
fprintf(f4,'c     008017 0.00008 $ O-17(abu. =0.04 %%)\n');
fprintf(f4,'c 008018 0.00041$ O-18(abu. =0.20 %%, not available)\n');
fprintf(f4,'     006000 0.1034 $ C (naturally occurring)\n');
fprintf(f4,'     001001 0.2069 $ H-1(abu. = 99.985 %%)\n');
fprintf(f4,'     001002 0.00003 $ H-2(abu. = 0.015 %%)\n');
fprintf(f4,'c *** TNT: HE Model #3 (C7 H5 N3 O6, rho = -1.65 g/cc) ***\n');
fprintf(f4,'M005 007014 0.1030 $ N-14(abu. = 99.63 %%)Air, rho = -0.001225 g/cc\n');
fprintf(f4,'     007015 0.00038 $ N-15(abu. =0.37 %%)\n');
fprintf(f4,'     008016 0.2068 $ O-16(abu. = 99.76 %%)\n');
fprintf(f4,'     008017 0.000083 $ O-17(abu. =0.04 %%)\n');
fprintf(f4,'c 008018 0.00041$ O-18(abu. =0.20 %%, not available)\n');
fprintf(f4,'     006000 0.2414 $ C (naturally occurring)\n');
fprintf(f4,'     001001 0.1724 $ H-1(abu. = 99.985 %%)\n');
fprintf(f4,'     001002 0.00026 $ H-2(abu. = 0.015 %%)\n');
fprintf(f4,'C *** NaI(Tl): Detector Model #1 (rho = 3.67 g/cc)\n');
fprintf(f4,'M006 011023.80c 0.50 $ Na-23 (abu. = 100 %%)\n');
fprintf(f4,'     053127.80c 0.50 $ I (abu. = 100 %%)\n');
fprintf(f4,'C *** BaF2: Detector Model #2 (rho = 4.88 g/cc)\n');
fprintf(f4,'M007 056000 0.333333 $ Ba (naturally occuring)\n');
fprintf(f4,'     009000 0.666667 $ F (naturally occuring)\n');
fprintf(f4,'C *** BGO Detector Model #3 (B4 Ge3 O12 rho = 7.13 g/cc)\n');
fprintf(f4,'M008 083000 0.21053 $ Bi (naturally occuring)\n');
fprintf(f4,'     032000 0.15789 $ Ge (naturally occuring)\n');
fprintf(f4,'     008016 0.631327 $ O-16(abu. = 99.76 %%)\n');
fprintf(f4,'     008017 0.000025 $ O-17(abu. =0.04 %%)\n');
fprintf(f4,'c 008018 0.00041 $ O-18(abu. =0.20 %%, not available)\n');
fprintf(f4,'C *** LaBr3(Ce): Detector Model #4 (rho = 5.29 g/cc)\n');
fprintf(f4,'M009 057000 0.25 $ La (naturally occuring)\n');
fprintf(f4,'     035000 0.75 $ B (naturally occuring)\n');
fprintf(f4,'C *** General Elemental Materials- Hydrogen\n');
fprintf(f4,'M010 001001 0.99985 $ H-1(abu. = 99.985 %%)\n');
fprintf(f4,'     001002 0.00015 $ H-2(abu. = 0.015 %%)\n');
fprintf(f4,'C *** General Elemental Materials- Carbon(rho = 2.267 g/cc)\n');
fprintf(f4,'M011 006000 0.99999999 $ C (naturally occurring)\n');
fprintf(f4,'C *** General Elemental Materials- Nitrogen\n');
fprintf(f4,'M012 007014 0.9963 $ N-14(abu. = 99.63 %%)Air, rho = -0.001225 g/cc\n');
fprintf(f4,'     007015 0.0037 $ N-15(abu. =0.37 %%)\n');
fprintf(f4,'C *** General Elemental Materials- Oxygen\n');
fprintf(f4,'M013 008016 0.9996 $ O-16(abu. = 99.76 %%)\n');
fprintf(f4,'     008017 0.0004 $ O-17(abu. =0.04 %%)\n');
fprintf(f4,'c 008018 0.00041$ O-18(abu. =0.20 %%, not available)\n');
fprintf(f4,'c *** Silica (Si02, using rho = 2.8 g/cc for illite): Solid Model #1 ***\n');
fprintf(f4,'M014 008016 0.6664 $ O-16(abu. = 99.76 %%)\n');
fprintf(f4,'     008017 0.000267 $ O-17(abu. =0.04 %%)\n');
fprintf(f4,'c 008018 0.000001$ O-18(abu. =0.20 %%, not available)\n');
fprintf(f4,'     014000 0.333333 $ Si (naturally occuring)\n');
fprintf(f4,'c *** Lead *** (rho = 11.34 g/cc)\n');
fprintf(f4,'M015 082204.70c 0.014 $ Pb-204 (1.4%%)\n');
fprintf(f4,'     082206.70c 0.241 $ Pb-204 (24.1%%)\n');
fprintf(f4,'     082207.70c 0.221 $ Pb-204 (22.1%%)\n');
fprintf(f4,'     082208.70c 0.524 $ Pb-204 (52.4%%)\n');
fprintf(f4,'C *** Clay Model 1 (rho = 2.92g/cc) used for natural clay soil or brick material ***\n');
fprintf(f4,'M016 014028.80c 0.03030 $ Si (naturally occuring)\n');
fprintf(f4,'     013027.80c 0.06061 $ Aluminum, Al (naturally occuring)\n');
fprintf(f4,'     026056.80c 0.06061 $ Iron, Fe (naturally occuring)\n');
%fprintf(f4,'     022000.60c 0.03030 $ Titanium, Ti (naturally occuring)\n');
fprintf(f4,'     022048.80c 0.02234 $ Ti-48 (73.72%%)\n');
fprintf(f4,'     022046.80c 0.00250 $ Ti-46 (8.25%%)\n');
fprintf(f4,'     022047.80c 0.00225 $ Ti-47 (7.44%%)\n');
fprintf(f4,'     022049.80c 0.00164 $ Ti-49 (5.41%%)\n');
fprintf(f4,'     022050.80c 0.00157 $ Ti-50 (5.18%%)\n');
%fprintf(f4,'     012000.60c 0.03030 $ Magnesium, Mg (naturally occuring)\n');
fprintf(f4,'     012024.80c 0.02394 $ Mg-24 (79.00%%)\n');
fprintf(f4,'     012025.80c 0.00303 $ Mg-25 (10.00%%)\n');
fprintf(f4,'     012026.80c 0.00333 $ Mg-26 (11.00%%)\n');
fprintf(f4,'     020040.80c 0.03030 $ Calcium, Ca (naturally occuring)\n');
fprintf(f4,'c     011023.80c 0.06061 $ Sodium, Na-23 (abu. 100%%)\n');
fprintf(f4,'     019039.80c 0.06061 $ Potassium, K (naturally occuring)\n');
fprintf(f4,'c     015031.80c 0.06061 $ Phosphorus, P (naturally occuring)\n');
fprintf(f4,'     008016.80c 0.57576 $ Oxygen, O-16 (abu. 100%%)\n');
fprintf(f4,'c *** Model for crushed igneous rock (rho = 2.85 g/cc) ***\n');
fprintf(f4,'M017 014000 0.03125 $ Si (naturally occuring)\n');
fprintf(f4,'     013027 0.06250 $ Aluminum, Al (naturally occuring)\n');
fprintf(f4,'     026000 0.03125 $ Iron, Fe (naturally occuring)\n');
fprintf(f4,'     022000 0.03125 $ Titanium, Ti (naturally occuring)\n');
fprintf(f4,'     025000 0.03125 $ Manganese, Mn (naturally occuring)\n');
fprintf(f4,'     012000 0.03125 $ Magnesium, Mg (naturally occuring)\n');
fprintf(f4,'     020000 0.03125 $ Calcium, Ca (naturally occuring)\n');
fprintf(f4,'     011023 0.06250 $ Sodium, Na-23 (abu. 100%%)\n');
fprintf(f4,'     019000 0.06250 $ Potassium, K (naturally occuring)\n');
fprintf(f4,'     015031 0.06250 $ Phosphorus, P (naturally occuring)\n');
fprintf(f4,'     008016 0.56250 $ Oxygen, O-16 (abu. 100%%)\n');
fprintf(f4,'c *** Model for modern soda-lime-silica glass (used for making bottles and windows)\n');
fprintf(f4,'c *** (rho = 2.57 g/cc) ***\n');
fprintf(f4,'M018 014000 0.06667 $ Silicon, Si (naturally occuring)\n');
fprintf(f4,'     013027 0.13333 $ Aluminum, Al (naturally occuring)\n');
fprintf(f4,'     012000 0.06667 $ Magnesium, Mg (naturally occuring)\n');
fprintf(f4,'     020000 0.06667 $ Calcium, Ca (naturally occuring)\n');
fprintf(f4,'     011023 0.13333 $ Sodium, Na-23 (abu. 100%%)\n');
fprintf(f4,'     008016 0.53333 $ Oxygen, O-16 (abu. 100%%)\n');
fprintf(f4,'c ***************************** Fuels ******************************************\n');
fprintf(f4,'c *** Methane- CH4 (rho = 0.000717 g/cc)\n');
fprintf(f4,'M019 006000 0.20000 $ Carbon, C (naturally occuring)\n');
fprintf(f4,'     001001 0.80000 $ Hydrogen, H (abu. 100%%)\n');
fprintf(f4,'C *** Propane- C3H8 (rho = 0.00183 g/cc)\n');
fprintf(f4,'M020 006000 0.27273 $ Carbon, C (naturally occuring)\n');
fprintf(f4,'     001001 0.72727 $ Hydrogen, H (abu. 100%%)\n');
fprintf(f4,'C *** Butane- C4H10 (rho = 0.00252 g/cc)\n');
fprintf(f4,'M021 006000 0.28571 $ Carbon, C (naturally occuring)\n');
fprintf(f4,'     001001 0.71429 $ Hydrogen, H (abu. 100%%)\n');
fprintf(f4,'C *** Octane- C8H18 (rho = 0.703 g/cc)\n');
fprintf(f4,'M022 006000 0.30769 $ Carbon, C (naturally occuring)\n');
fprintf(f4,'     001001 0.69231 $ Hydrogen, H (abu. 100%%)\n');
fprintf(f4,'C *** Diesel- C12H26 (rho = 1.25 g/cc)\n');
fprintf(f4,'M023 006000 0.31579 $ Carbon, C (naturally occuring)\n');
fprintf(f4,'     001001 0.68421 $ Hydrogen, H (abu. 100%%)\n');
fprintf(f4,'C *** Methanol- CH3OH (rho = 0.7918 g/cc)\n');
fprintf(f4,'M024 006000 0.16667 $ Carbon, C (naturally occuring)\n');
fprintf(f4,'     001001 0.66667 $ Hydrogen, H (abu. 100%%)\n');
fprintf(f4,'     008016 0.16667 $ Oxygen, O (abu. 100%%)\n');
fprintf(f4,'C *** Ethanol- CH3CH2OH (rho = 0.789 g/cc)\n');
fprintf(f4,'M025 006000 0.22222 $ Carbon, C (naturally occuring)\n');
fprintf(f4,'     001001 0.66667 $ Hydrogen, H (abu. 100%%)\n');
fprintf(f4,'     008016 0.11111 $ Oxygen, O (abu. 100%%)\n');
fprintf(f4,'c ******************************************************************************\n');
fprintf(f4,'c *** Water (rho = 1.000 g/cc)************************************************\n');
fprintf(f4,'M026 001001 0.66667 $ Hydrogen, H (abu. 100%%)\n');
fprintf(f4,'     008016 0.33333 $ Oxygen, O (abu. 100%%)\n');
fprintf(f4,'c *** Table Sugar (Sucrose) C12H22O11 (rho = 1.57 g/cc)***********************\n');
fprintf(f4,'M027 006000 0.26667 $ Carbon, C (naturally occuring)\n');
fprintf(f4,'     001001 0.48889 $ Hydrogen, H (abu. 100%%)\n');
fprintf(f4,'     008016 0.24444 $ Oxygen, O (abu. 100%%)\n');
fprintf(f4,'c *** Lithium Carbonate (Li2CO3 (rho = 2.11 g/cc)*****************************\n');
fprintf(f4,'M028 003006 0.00250 $ Lithium, Li-6 (abu. 7.5 %%)\n');
fprintf(f4,'     003007 0.30833 $ Lithium-7 (abu. 92.5 %%)\n');
fprintf(f4,'     006000 0.16667 $ Carbon, C (naturally occuring)\n');
fprintf(f4,'     008016 0.50000 $ Oxygen, O (abu. 100%%)\n');
fprintf(f4,'c *** Elemental Silicon (rho = 2.3296 g/cc) ************************************\n');
fprintf(f4,'M029 014000 1.00000 $ Silicon, Si (abu. 100%%)\n');
fprintf(f4,'c *** Borated Plastic (polyethylene with 5 %% B by weight) (rho = 1.04 g/cc)\n');
fprintf(f4,'M030 006000.80c 0.3259 $ Carbon, C(naturally occuring)\n');
fprintf(f4,'     001001.80c 0.6518 $ Hydrogen, H (abu. 100%%)\n');
fprintf(f4,'     005010.80c 0.00446 $ Boron-10, B (20 %% of Boron)\n');
fprintf(f4,'     005011.80c 0.01784 $ Boron-11, B (80 %% of Boron 0.0223)\n');
fprintf(f4,'c *** Tungsten, W  (rho = 19.30 g/cc)*********************************************\n');    
fprintf(f4,'M031 074182.80c 0.2650 $ W-182 (26.50%%)\n');
fprintf(f4,'     074183.80c 0.1431 $ W-183 (14.31%%)\n');
fprintf(f4,'     074184.80c 0.3640 $ W-184 (30.64%%)\n');
fprintf(f4,'     074186.80c 0.2843 $ W-186 (28.43%%)\n');
fprintf(f4,'c\n');
fprintf(f4,'c ***** Concrete, Ordinary (NIST) (rho = 3.2 g/cc) *****************************************\n');
fprintf(f4,'M032 001001 0.305330  $ H\n');
fprintf(f4,'     006000 0.002880  $ C\n');
fprintf(f4,'     008016 0.500407  $ O\n');
fprintf(f4,'     011023 0.009212  $ Na\n');
fprintf(f4,'     012000 0.000725  $ Mg\n');
fprintf(f4,'     013027 0.010298  $ Al\n');
fprintf(f4,'     014000 0.151042  $ Si\n');
fprintf(f4,'     019000 0.003578  $ K\n');
fprintf(f4,'     020000 0.014924  $ Ca\n');
fprintf(f4,'     026000 0.001605  $ Fe\n');
fprintf(f4,'c ****** Concrete, Luminite-Portland-colemanite-baryte (rho = 3.1 g/cc) *********************\n');
fprintf(f4,'M033 001001 0.248270 $ H\n');
fprintf(f4,'     005010.80c 0.0044928 $ Boron-10, B (20 %% of Boron)\n');
fprintf(f4,'     005011.80c 0.0171712 $ Boron-11, B (80 %% of Boron 0.021464)\n');
fprintf(f4,'     008016 0.525811 $ O\n');
fprintf(f4,'     011023 0.001088 $ Na\n');
fprintf(f4,'     012000 0.001872 $ Mg\n');
fprintf(f4,'     013027 0.011129 $ Al\n');
fprintf(f4,'     014000 0.012069 $ Si\n');
fprintf(f4,'     016000 0.063640 $ S\n');
fprintf(f4,'     020000 0.043537 $ Ca\n');
fprintf(f4,'     022000 0.000337 $ Ti\n');
fprintf(f4,'     025055 0.000166 $ Mn\n');
fprintf(f4,'     026000 0.007618 $ Fe\n');
fprintf(f4,'     056000 0.062999 $ Ba\n');
fprintf(f4,'c *** Iron, Fe56  (rho = 7.874 g/cc)*********************************************\n');    
fprintf(f4,'M040 026056.80c 1.00000 $ Fe-56 (100%%)\n');
fprintf(f4,'c *** Copper, Cu  (rho = 8.96 g/cc)*********************************************\n');    
fprintf(f4,'M041 029063.80c 0.6915 $ Cu-63 (69.15%%)\n');
fprintf(f4,'     029065.80c 0.3085 $ Cu-65 (30.85%%)\n');
fprintf(f4,'c\n');


% Tallies

fprintf(f4,'c **********************Tally Cards*****************************************\n');
fprintf(f4,'c\n');
fprintf(f4,'c\n');
fprintf(f4,'PRINT 10 40 50 86 100 110 126 140 160\n');
fprintf(f4,'c\n');


% Sources
fprintf(f4,'c **********************Source*****************************************\n');
fprintf(f4,'c\n');

fprintf(f4,'MODE P $  Photon interactions\n');
%fprintf(f4,'PHYS:N J 20  $ Polimi Neutron treatment\n');
fprintf(f4,'PHYS:P 100 0 0 0 1  $ Polimi photon treatment\n');
fprintf(f4,'IMP:P 1 %dr 0 $ Cell 99999 is termination\n',PolimiParameters.nTotalCells-1);
%fprintf(f4,'IMP:N 1 %dr 0 $ Cell 99999 is termination\n',PolimiParameters.nTotalCells-1);
fprintf(f4,'c\n');
fprintf(f4,'c\n');




% if RunParameters(1).SourceDist == 1;% Plane Photon Source
%     fprintf(f4,'SDEF ERG=0.662  PAR=2 POS= %d %d %d X=0 Y=d1 Z=d2  $ Plane Photon source \n',PolimiParameters.SourcePositionX,PolimiParameters.SourcePositionY,PolimiParameters.SourcePositionZ);
%     fprintf(f4,'SI1 %d %d \n',PolimiParameters.SourcePositionY-PolimiParameters.InterrogationHeight/2,PolimiParameters.SourcePositionY+PolimiParameters.InterrogationHeight/2);
%     fprintf(f4,'SP1 0 1 \n');
%     fprintf(f4,'SI2 %d %d \n',PolimiParameters.SourcePositionZ-PolimiParameters.InterrogationWidth/2,PolimiParameters.SourcePositionZ+PolimiParameters.InterrogationWidth/2);
%     fprintf(f4,'SP2 0 1 \n');
%     
%     
% end

% Calculate detector corner vectors to image plane source point  
    
    Corner1 = [PolimiParameters.DetectorXMax PolimiParameters.DetectorYMax PolimiParameters.DetectorZMax];
    Corner2 = [PolimiParameters.DetectorXMax PolimiParameters.DetectorYMax PolimiParameters.DetectorZMin];
    Corner3 = [PolimiParameters.DetectorXMax PolimiParameters.DetectorYMin PolimiParameters.DetectorZMax];
    Corner4 = [PolimiParameters.DetectorXMax PolimiParameters.DetectorYMin PolimiParameters.DetectorZMin];
    Corner5 = [PolimiParameters.DetectorXMin PolimiParameters.DetectorYMax PolimiParameters.DetectorZMax];
    Corner6 = [PolimiParameters.DetectorXMin PolimiParameters.DetectorYMax PolimiParameters.DetectorZMin];
    Corner7 = [PolimiParameters.DetectorXMin PolimiParameters.DetectorYMin PolimiParameters.DetectorZMax];
    Corner8 = [PolimiParameters.DetectorXMin PolimiParameters.DetectorYMin PolimiParameters.DetectorZMin];

% Find largest angel between center and corner

    Center = [(PolimiParameters.DetectorXMax+PolimiParameters.DetectorXMin)/2 (PolimiParameters.DetectorYMax+PolimiParameters.DetectorYMin)/2 (PolimiParameters.DetectorZMax+PolimiParameters.DetectorZMin)/2];
    
    
    SourcePosition = [PolimiParameters.SourceDistance SystemMatrix(iSims).SourceLocation(1) SystemMatrix(iSims).SourceLocation(2)];
    
    CenterV = Center-SourcePosition;
    
    CornerV1 = -(SourcePosition - Corner1);
    CornerV2 = -(SourcePosition - Corner2);
    CornerV3 = -(SourcePosition - Corner3);
    CornerV4 = -(SourcePosition - Corner4);
    CornerV5 = -(SourcePosition - Corner5);
    CornerV6 = -(SourcePosition - Corner6);
    CornerV7 = -(SourcePosition - Corner7);
    CornerV8 = -(SourcePosition - Corner8);
               
    Angle1 = atan2(norm(cross(CenterV,CornerV1)),dot(CenterV,CornerV1));
    Angle2 = atan2(norm(cross(CenterV,CornerV2)),dot(CenterV,CornerV2));
    Angle3 = atan2(norm(cross(CenterV,CornerV3)),dot(CenterV,CornerV3));
    Angle4 = atan2(norm(cross(CenterV,CornerV4)),dot(CenterV,CornerV4));
    Angle5 = atan2(norm(cross(CenterV,CornerV5)),dot(CenterV,CornerV5));
    Angle6 = atan2(norm(cross(CenterV,CornerV6)),dot(CenterV,CornerV6));
    Angle7 = atan2(norm(cross(CenterV,CornerV7)),dot(CenterV,CornerV7));
    Angle8 = atan2(norm(cross(CenterV,CornerV8)),dot(CenterV,CornerV8));
    
    AngleMax = max([Angle1,Angle2,Angle3,Angle4,Angle5,Angle6,Angle7,Angle8]);
    
    %Angle = cos(AngleMax);
    Angle = cosd(10);
    
% Print Source Definition
    fprintf(f4,'SDEF ERG=0.662 PAR=2 POS= %d %d %d \n',PolimiParameters.SourceDistance, SystemMatrix(iSims).SourceLocation(1),SystemMatrix(iSims).SourceLocation(2));
    fprintf(f4,'     VEC = %d %d %d DIR = d1 $ Cs-137 at image plane location\n',CenterV(1),CenterV(2),CenterV(3));
    fprintf(f4,'SI1 %d 1\n',Angle);
    fprintf(f4,'SP1 0 1\n');
    fprintf(f4,'c\n');



%Transformation Card
     % Calculate Transformation
    % [TransformationMatrix] = MaskRotation(PolimiParameters);
     
%      
%      fprintf(f4, '*TR1 ');
%      
%      for k = 1:13
%          fprintf(f4, '%d ',TransformationMatrix(iAngles,k));
%      end
%      
%      fprintf(f4,'\n');
%     
    
fprintf(f4,'CUT:N 2J 0\n');
fprintf(f4,'CUT:P 2J 0\n');
fprintf(f4,'c\n');


fprintf(f4,'IPOL 0 J J J J 1 %d \n',PolimiParameters.DetectorSurfaceEnd-PolimiParameters.DetectorSurfaceStart+1);

for nCell = 1:(PolimiParameters.DetectorSurfaceEnd-PolimiParameters.DetectorSurfaceStart+1)
    fprintf(f4,'     %d\n',PolimiParameters.DetectorCellStart-1+nCell);
end

fprintf(f4,'RPOL 0.001 0.001\n');
fprintf(f4,'FILES 21 DUMN1 \n'); %3J 22 DUMN2
fprintf(f4,'NPS %d \n',PolimiParameters.NPS);

fprintf(f4,'c\n');
fclose(f4);

end