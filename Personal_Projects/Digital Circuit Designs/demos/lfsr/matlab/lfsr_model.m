% lfsr_model.m
%--------------
% A function to model one clock cycle in an LFSR.
%
% Inputs:
%   * state - an N-bit binary array containing the LFSR state
%   * taps  - an array of tap positions
%
% Outputs:
%   * output - an N-bit binary array containing the new LFSR state
%

function output = lfsr_model(state, taps)

    N        = length(state);
    
    % XOR function:
    feedback = mod(sum(state(taps)),2);
    
    % Shift register:
    output(2:N) = state(1:N-1);
    output(1)   = feedback;
end
