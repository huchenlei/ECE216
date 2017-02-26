function [ Y ] = ADSR_env( Z, beat_length, num_beats, fs )
%ADSR_env uses envelopes to produce a strummed version of Z
%   given a signal Z, the beat length in seconds, the number of beats to be 
%   covered by a single repetition of the strum pattern, and the sampling
%   frequency of the original signal, this function outputs Y, a strummed
%   version of Z

%n is the number of samples per repetition of the strum pattern
n = floor(fs*beat_length*num_beats);
%E will be our envelope for one strum pattern
E = zeros(n,1);

%strums is a vector indicating what fraction of the way through the
%envelope each strum will be performed
strums = [0, 1/4, 11/16, 3/4, 15/16];
%ADSR contains fractional lengths of attack, decay, sustain, and release segments
ADSR = [0.1,0.4,0.4,0.1]; %entries here should sum to 1
peak = 1; %peak volume
mid = 0.2; %sustain volume

A = 0;
D = ADSR(1);
S = D+ADSR(2);
R = S+ADSR(3);

ind = 0; %keeps track of which index of E the next strum will start from
%each iteration of the for loop generates a single strum
for i=1:length(strums)
    if(i~=length(strums))
        k = floor(n*strums(i+1))-ind;
    else
        k = n-ind;
    end
    d = floor(D*k);
    s = floor(S*k);
    r = floor(R*k);
    F = zeros(1,k); %F will be the envelope for a single strum
    F(1:d) = linspace(0,peak,d); %attack
    F(d+1:s) = linspace(peak,mid,s-d); %decay
    F(s+1:r) = linspace(mid,mid,r-s); %sustain
    F(r+1:k) = linspace(mid,0,k-r); %release
    E(ind+1:ind+k) = F; %append each F to E
    ind = ind + k;
end

E(ind+1:n) = E(ind); %just to account for floor effects

reps = length(Z)/n; %maximum number of strum pattern repetitions needed for the song
E_rep = repmat(E,1,ceil(reps)); %repeat the strum pattern enough times
Y = E_rep(1:length(Z)).*Z; %multiply E_rep with X, truncating E_rep to be the same length as X
end

