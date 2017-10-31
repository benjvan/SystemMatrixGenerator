function [MaskParameters] = MaskCreation(MaskParameters)

    % Mask Pattern
    
        if MaskParameters.Pattern == 1
            [MaskParameters] = MaskCreateMura(MaskParameters);
            fprintf('Mura mask created.\n')
        

            % MosaicMuraMask - Takes the n x n mask and mosaics it into a (2*n-1) x (2*n-1) mask if selected in run options

            if MaskParameters.MosaicMuraMask == 1
                [MaskParameters] = MaskMosaic(MaskParameters);
                fprintf('Original Mura mask mosaiced into %d x %d array.\n',size(MaskParameters.Ac,1),size(MaskParameters.Ac,2))
            end

        end
        
        
        if MaskParameters.Pattern == 2
            
            [MaskParameters] = MaskCreatePinhole(MaskParameters);
            fprintf('Pinhole mask created.\n')

        end
        

        if MaskParameters.Pattern == 3
            
            [MaskParameters] = MaskCreateOpenCross(MaskParameters);
            fprintf('Open Cross mask created.\n')

        end
        
        
        if MaskParameters.Pattern == 4
            
            [MaskParameters] = MaskCreateRandom(MaskParameters);
            fprintf('Random mask created.\n')

        end         
        
        
end