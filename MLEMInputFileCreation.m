function MLEMInputFileCreation(FileNames,iSims)

f_list = {FileNames.CellCard{iSims}, FileNames.SurfaceCard{iSims}, FileNames.DataCard{iSims}};
f5 = fopen(FileNames.input{iSims},'w');

rng('shuffle')

% Write Output filename and RunTPE filename
fprintf(f5,'MESSAGE: outp=%s',FileNames.output{iSims});
fprintf(f5,'\n');
fprintf(f5,'     ');
fprintf(f5,'runtpe=%s',FileNames.RUNTP{iSims});
fprintf(f5,'\n');
fprintf(f5,'     ');
fprintf(f5,'DUMN1=%s',FileNames.DUMN1{iSims});
fprintf(f5,'\n');
fprintf(f5,'\n');

for i = 1:length(f_list)
    f_old = fopen(f_list{i},'r');
    f_line = fgetl(f_old);

    while ischar(f_line)
        fprintf(f5,'%s',f_line);
        fprintf(f5,'\n');
        f_line = fgetl(f_old);
    end
    fclose(f_old);
end


%Generate randomn seed
Seed = ceil(100000000000000*rand());
while mod(Seed,2) == 0

        Seed = ceil(100000000000000*rand());
end
fprintf(f5,'DBCN %1.14d \n',Seed);


fclose(f5);

end