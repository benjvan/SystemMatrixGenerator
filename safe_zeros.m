function [ array ] = safe_zeros(n, varargin)
%   SAFE_ZEROS - Creates an array of zeros but checks available memory
%   first.
%
%   Sam Walder - University of Bristol - 2015 - sam.walder@bristol.ac.uk
%
% =========================================================================
%   Input arguments:
%       * n - Number of row or both for a square array
%       * m - *Optional* - Number of columns. Square if omitted
%   Output arguments
%       * array - The array of zeros
% =========================================================================
%   Change Log:
%       * 2015 - Created
% =========================================================================
 
safety_factor = 0.1; % Memory to reserve, just to be safe
 
%% Check number of inputs and act accordingly

if nargin == 1
    % User has not defined m - presume square 
    m = n;
    o = 1;
elseif nargin == 2
    % User has defined m
    m = varargin{1};
    o = 1;
elseif nargin == 3
    % User has defined o
    m = varargin{1};
    o = varargin{2};
else
    % Cause an error
    error('Invalid number of arguments');
end; % if


%% Evaluate demaded size of the array
sizeof_double = 8; % Bytes
demanded_memory = m * n * o * sizeof_double;

% Introduce safety factor
demanded_memory = demanded_memory * (1+safety_factor);

%% Get avalible memory
[uV, sV] = memory;
Physicalmemory = sV.PhysicalMemory.Available;

%% Create array or throw error
if demanded_memory < Physicalmemory
    % Create the array
    if nargin <= 2
        array = zeros(n, m);
    end
    if nargin == 3
        array = zeros(n, m, o);
    end
    %disp(strcat('Demand = ', num2eng(demanded_memory)));
    %disp(strcat('Avalible = ', num2eng(Physicalmemory)));
else
    % Tell the user no
    error('Not enough memory to create array');
end; % if


end % function