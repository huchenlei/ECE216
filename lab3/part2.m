fs = 11025;
x1 = get_wave('C', 'm', 2, fs);
x2 = get_wave('E', 'm', 2, fs);
x3 = get_wave('G', 'm', 2, fs);
C = x1 + x2 + x3;

G = get_chord_wave('G', 2, fs);
Am = get_chord_wave('Am', 2, fs);

soundsc(C, fs);
soundsc(G, fs);
soundsc(Am, fs);