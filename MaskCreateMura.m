function [MaskParameters] = MaskCreateMura(MaskParameters)


%MCNP Aperture Cell Declaration



% - create the mura mask text code for input into the MCNP
A = zeros(MaskParameters.MaskSequenceLength);    % mask matrix
Ar = zeros(MaskParameters.MaskSequenceLength);    % physical matrix
G = zeros(MaskParameters.MaskSequenceLength);    % reconstruction matrix
C = zeros(MaskParameters.MaskSequenceLength,1);

% create the coefficients for the mask generation
% first create array of quadratic residues to mod p
residues = 0;   % start list of residues
for (i = 1:floor(MaskParameters.MaskSequenceLength/2)) % need only look to p/2 because of symmetry of residues... see Wolfram Mathematica Article
    newres = mod(i^2,MaskParameters.MaskSequenceLength);   % new quadratic residue to be added to list
    residues = [residues newres];
end % for i
% calculate the C coefficients
for (i = 0:MaskParameters.MaskSequenceLength-1)
    C(i+1,1) = -1;
    restrue = 0;  % residue boolean
    % see if i is quadratic residue mod p
    for (j = 1:length(residues))
        if (i == residues(j) && restrue == 0)
            restrue = 1;  % use this boolean to make sure that it doesn't reset to -1
            C(i+1,1) = 1;
        end % end if
    end  % end for j
end % for i




% evaluate the A matrix
% I would prefer to index the matrix starting at 0, but matlab doesn't
% allow that
for (i = 0:MaskParameters.MaskSequenceLength-1)
    for (j = 0:MaskParameters.MaskSequenceLength-1)
        if (i == 0)
            A(i+1,j+1) = 0;
        elseif (j == 0 && i > 0)
            A(i+1,j+1) = 1;
        elseif (C(i+1,1)*C(j+1,1) == 1)
            A(i+1,j+1) = 1;
        else
            A(i+1,j+1) = 0;
        end  % end of long if then else statement
    end % for j
end  % for i

% evaluate decoding G matrix
for (i = 0:MaskParameters.MaskSequenceLength-1)
    for (j = 0:MaskParameters.MaskSequenceLength-1)
        if (i + j == 0)
            G(i+1,j+1) = 1;
        else
            if (A(i+1,j+1) == 1)
                G(i+1,j+1) = 1;
            else
                G(i+1,j+1) = -1;
            end
        end  % end of long if then else statement
    end % for j
end  % for i




MaskParameters.A = A;
MaskParameters.G = G;

% try to make the pattern symmetric by cyclic permutation with top row in
% center and left column in center
shift = [floor(MaskParameters.MaskSequenceLength/2) floor(MaskParameters.MaskSequenceLength/2)];
Ac = circshift(A,shift);
Gc = circshift(G,shift);

Ac(ceil(size(Ac,1)/2),ceil(size(Ac,2)/2)) = 0;

Gc(ceil(size(Ac,1)/2),ceil(size(Ac,2)/2)) = 1;

% output to clearly named variable
MaskParameters.Ac = Ac;
MaskParameters.Gc = Gc;

MaskParameters.AcOriginal = Ac;
MaskParameters.GcOriginal = Gc;
end

