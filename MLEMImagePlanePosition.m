function [SystemMatrix] = MLEMImagePlanePosition(PolimiParameters,MLEM)


for i = 1:MLEM.nSims

[I,J] = ind2sub([PolimiParameters.SourcePixelNumber PolimiParameters.SourcePixelNumber],i);



SystemMatrix(i).SourceLocation = [PolimiParameters.SourcePlaneLength/2-PolimiParameters.SourcePlaneLength/PolimiParameters.SourcePixelNumber*I+PolimiParameters.SourcePlaneLength/PolimiParameters.SourcePixelNumber/2 -PolimiParameters.SourcePlaneLength/2+PolimiParameters.SourcePlaneLength/PolimiParameters.SourcePixelNumber*J-PolimiParameters.SourcePlaneLength/PolimiParameters.SourcePixelNumber/2];

end



end