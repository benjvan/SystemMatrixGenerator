function [MaskParameters] = MaskCreateRandom(MaskParameters)

% - Create the random mask text code for input into the MCNP
    n = MaskParameters.MaskSequenceLength;
    m = n;


    N0 = ceil(n*m/2) ; % specify half to be zeros
    A = ones(n,m) ; A(1:N0) = 0 ; A(randperm(numel(A))) = A; % reconstruction matrix


	G = A;
    G(G == 0) = -1;
    
    
    MaskParameters.AcOriginal = A;
    MaskParameters.GcOriginal = G;
    
    
    MaskParameters.Ac = A;
    MaskParameters.Gc = G;
    
end