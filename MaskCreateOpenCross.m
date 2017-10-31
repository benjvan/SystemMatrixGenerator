function [MaskParameters] = MaskCreateOpenCross(MaskParameters)

% - Create the pinhole mask text code for input into the MCNP
    A = zeros(MaskParameters.MaskSequenceLength);    % mask matrix
    G = zeros(MaskParameters.MaskSequenceLength);    % reconstruction matrix

% Find center pinhole - set to 0 - open

    A(ceil(size(A,1)/2),:) = 1;
    A(:,ceil(size(A,2)/2)) = 1;
    
    
    G(ceil(size(G,1)/2),:) = 1;
    G(:,ceil(size(G,2)/2)) = 1;
     
    G(G == 0) = - 1/(numel(G)-(size(G,1)+size(G,2)-1))/(1-1/(numel(G)-(size(G,1)+size(G,2)-1)));
    %G(G == 0) = -1/(numel(G)/(numel(G)-(size(G,1)+size(G,2)-1)));
    
    
    MaskParameters.AcOriginal = A;
    MaskParameters.GcOriginal = G;
    
    MaskParameters.Ac = A;
    MaskParameters.Gc = G;  
end