function [MaskParameters] = MaskMosaic(MaskParameters)

C1 = cat(1,MaskParameters.A,MaskParameters.A);
C2 = cat(2,C1,C1);
AcMosaic = C2(2:end,2:end);

GcMosaic = AcMosaic;
GcMosaic(AcMosaic==1) =  1;
GcMosaic(AcMosaic==0) = -1;

GcMosaic(ceil(size(AcMosaic,1)/2),ceil(size(AcMosaic,2)/2)) = 1;


MaskParameters.Ac = AcMosaic;
MaskParameters.Gc = GcMosaic;

end


