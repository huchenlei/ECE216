fs = 11025;
beat_duration = 60/144;

ttls_array = {'G', 1; 'G', 1; 'G', 1; 'G', 1;
'C', 1; 'C', 1; 'G', 2;
'C', 1; 'C', 1; 'G', 1; 'G', 1;
'Dm', 1; 'Dm', 1; 'G', 2;
};

song = get_song_wave(ttls_array, beat_duration ,fs);
ADSR_song = ADSR_env(song, beat_duration, 4, fs);

% soundsc(ADSR_song, fs);

spectrogram(ADSR_song,[],[],[], fs);
colorbar;
