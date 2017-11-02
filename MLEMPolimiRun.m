function MLEMPolimiRun(FileNames,iSims)


%Run Mask

            command = ['polimi ','i= ',FileNames.input{iSims}];

            [status,cmdout] = system(command,'-echo');
     
            display(cmdout)

end