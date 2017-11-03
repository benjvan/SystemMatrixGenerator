function  MLEMDumpInteractions(iSims)


load(fullfile(pwd,['SortedDumn1Data' num2str(iSims) '.mat']),'Dumn1Data');


fprintf('%d\n',iSims)

MaskIndex(1,1) = 1;
for i = 2:size(Dumn1Data,1)
    if Dumn1Data(i,1) == Dumn1Data(i-1,1)
        MaskIndex(i,1) = MaskIndex(i-1,1);
    else
        MaskIndex(i,1) = MaskIndex(i-1,1)+1;
    end
end


% Move to permenant matrix

GammaInteractionData.RawMaskInteractionPositions(:,1) = MaskIndex;
GammaInteractionData.RawMaskInteractionPositions(:,2) = Dumn1Data(:,9); %x
GammaInteractionData.RawMaskInteractionPositions(:,3) = Dumn1Data(:,10); % y
GammaInteractionData.RawMaskInteractionPositions(:,4) = Dumn1Data(:,11); %z
GammaInteractionData.RawMaskInteractionPositions(:,5) = Dumn1Data(:,7); % energy deposited


save(fullfile(pwd,['GammaInteractionData' num2str(iSims) '.mat']),'GammaInteractionData');



delete(fullfile(pwd,['SortedDumn1Data' num2str(iSims) '.mat']));


end


