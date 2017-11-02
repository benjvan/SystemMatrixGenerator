function MLEMCleanUp(FileNames,iSims)

% Delete Extra files

        delete(FileNames.output{iSims});
        
        delete(FileNames.RUNTP{iSims});
        
        delete(FileNames.CellCard{iSims});
        
        delete(FileNames.SurfaceCard{iSims});
        
        delete(FileNames.DataCard{iSims});

end