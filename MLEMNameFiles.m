function [FileNames] = MLEMNameFiles(MLEM)

    for i = 1:MLEM.nSims

        FileNames.SurfaceCard{i,1} = strcat('Matrix',num2str(MLEM.nNewSystemMatrix),'Location',num2str(i),'SurfaceCard.txt');         %Temporary file for examining surface output
        FileNames.CellCard{i,1} = strcat('Matrix',num2str(MLEM.nNewSystemMatrix),'Location',num2str(i),'MaskCellCard.txt');        %Temporary file for examining mask cell output
        FileNames.DataCard{i,1} = strcat('Matrix',num2str(MLEM.nNewSystemMatrix),'Location',num2str(i),'DataCard.txt');            %Temporary file for examining data section
        FileNames.input{i,1} = strcat('Matrix',num2str(MLEM.nNewSystemMatrix),'Location',num2str(i),'.i');                          % Mask run file
        FileNames.output{i,1} = strcat('Matrix',num2str(MLEM.nNewSystemMatrix),'Location',num2str(i),'.o');
        FileNames.DUMN1{i,1} = strcat('Matrix',num2str(MLEM.nNewSystemMatrix),'Location',num2str(i),'.dat');
        FileNames.RUNTP{i,1} = strcat('runtp','Matrix',num2str(MLEM.nNewSystemMatrix),'Location',num2str(i));
      
    end

end

