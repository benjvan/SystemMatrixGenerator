function MLEMWeightByEnergyCentroid(iSims)

load(fullfile(pwd,['GammaInteractionData' num2str(iSims) '.mat']),'GammaInteractionData');



% Mask interactions grouped by incident gamma and overall energy deposition position weighted by energy deposited

num_events = length(GammaInteractionData.RawMaskInteractionPositions);  % may be multiple events per history
totalhist = GammaInteractionData.RawMaskInteractionPositions(end,1);    % the number of histories (i.e. radiation impacts)

GammaInteractionData.MaskEnergy(1:totalhist,1) = zeros(totalhist,1);
GammaInteractionData.MaskEnergyWeightedCentroids(1:totalhist,1:3) = zeros(totalhist,3);  % x, y, and z coords with total energy deposited

i = 1;  % 1st history
for (j = 1:num_events)
    GammaInteractionData.MaskEnergyWeightedCentroids(i,1) = (GammaInteractionData.MaskEnergyWeightedCentroids(i,1)*GammaInteractionData.MaskEnergy(i,1) + GammaInteractionData.RawMaskInteractionPositions(j,2)*GammaInteractionData.RawMaskInteractionPositions(j,5))/(GammaInteractionData.MaskEnergy(i,1) + GammaInteractionData.RawMaskInteractionPositions(j,5));
    GammaInteractionData.MaskEnergyWeightedCentroids(i,2) = (GammaInteractionData.MaskEnergyWeightedCentroids(i,2)*GammaInteractionData.MaskEnergy(i,1) + GammaInteractionData.RawMaskInteractionPositions(j,3)*GammaInteractionData.RawMaskInteractionPositions(j,5))/(GammaInteractionData.MaskEnergy(i,1) + GammaInteractionData.RawMaskInteractionPositions(j,5));
    GammaInteractionData.MaskEnergyWeightedCentroids(i,3) = (GammaInteractionData.MaskEnergyWeightedCentroids(i,3)*GammaInteractionData.MaskEnergy(i,1) + GammaInteractionData.RawMaskInteractionPositions(j,4)*GammaInteractionData.RawMaskInteractionPositions(j,5))/(GammaInteractionData.MaskEnergy(i,1) + GammaInteractionData.RawMaskInteractionPositions(j,5));
    GammaInteractionData.MaskEnergy(i,1) = GammaInteractionData.MaskEnergy(i,1) + GammaInteractionData.RawMaskInteractionPositions(j,5);
    if (j + 1 <= num_events)
      if (GammaInteractionData.RawMaskInteractionPositions(j,1) == GammaInteractionData.RawMaskInteractionPositions(j+1,1)) % next history
      else
         i = i + 1;
      end 
    end  
    
end 



GammaInteractionData.MaskEnergyWeightedCentroids(:,4) = GammaInteractionData.MaskEnergy;

save(fullfile(pwd,['EnergyCentroid' num2str(iSims) '.mat']),'GammaInteractionData');


end