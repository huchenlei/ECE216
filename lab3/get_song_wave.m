function [ Z ] = get_song_wave( song, beat_length, fs )
%get_song_wave produces the time signal for a given song, beat length, and
%sampling frequency
%   song is a two column cell array of chord names and durations 

n_chords = length(song); %number of chords that get played

%for a longer song, good idea to preallocate Z instead of changing length
%each iteration, however, the code is simpler here - no calculation of song
%length (in terms of samples) required
Z = [];
for i=1:n_chords
    Z = [Z, get_chord_wave( song{i, 1} , beat_length * song{i, 2} ,fs)]; %fill in the blanks!
        %appends each chord to Z
end

end

