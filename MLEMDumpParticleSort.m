function MLEMDumpParticleSort(iSims)


load(fullfile(pwd,['Dumn1Data' num2str(iSims) '.mat']),'Dumn1Data');


DumpIndex(1,1) = 1;
for i = 2:size(Dumn1Data,1)
    if (Dumn1Data(i,1) == Dumn1Data(i-1,1)) && (Dumn1Data(i,2) == Dumn1Data(i-1,2)) && (Dumn1Data(i,6) == Dumn1Data(i-1,6))

        DumpIndex(i,1) = DumpIndex(i-1,1);
    else
        DumpIndex(i,1) = DumpIndex(i-1,1)+1;
    end
end



Dumn1Data(:,1) = DumpIndex(:,1); 




save(fullfile(pwd,['SortedDumn1Data' num2str(iSims) '.mat']),'Dumn1Data');

delete(fullfile(pwd,['Dumn1Data' num2str(iSims) '.mat']));
end
