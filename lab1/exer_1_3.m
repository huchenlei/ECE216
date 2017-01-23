[bass, fs]= audioread('bass.wav');
guitar = audioread('guitar.wav');
drums = audioread('drums.wav');

duration = 5;
b = bass(1:fs*duration);
g = guitar(1:fs*duration);
d = drums(1:fs*duration);

factor = linspace(0, 2, fs*duration);

comp = b + factor' .* g + d;

sound(comp, fs);
