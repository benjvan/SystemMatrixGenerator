function [MaskParameters] = MaskCreatePinhole(MaskParameters)

% - Create the pinhole mask text code for input into the MCNP
    A = zeros(MaskParameters.MaskSequenceLength);    % mask matrix
    G = zeros(MaskParameters.MaskSequenceLength);    % reconstruction matrix

% Find center pinhole - set to 0 - open

    A(ceil(size(A,1)/2),ceil(size(A,2)/2)) = 1;
    G(ceil(size(G,1)/2),ceil(size(G,2)/2)) = 1;
    
    G(G == 0) = -(1/numel(G))/(1-1/numel(G));
    
    %G(G == 0) = -1/numel(G);
    
    
    MaskParameters.AcOriginal = A;
    MaskParameters.GcOriginal = G;
    
    MaskParameters.Ac = A;
    MaskParameters.Gc = G;
end