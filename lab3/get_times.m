function [ T ] = get_times( duration, fs )
T = linspace(0, duration, ceil(duration * fs));
end

