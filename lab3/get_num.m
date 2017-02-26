function [ num ] = get_num( note, oct )
%get_num gets the key number for a given note
%   Given a note (e.g. 'A','Gb','Fs') and an octave designation ('h','m',
%   or 'l'), returns the corresponding key number
load key_data
if(length(note)==1)
    note = [note ' ']; %when storing strings in arrays, each string needs to be the same length
elseif(length(note)>2)
    error('The input note is not valid.');
end
oct_cand = find(allocts==oct);
logical = (allkeys == repmat(note,length(allkeys),1));
key_cand = find(logical(:,1).*logical(:,2));
indices = intersect(oct_cand,key_cand);
index = indices(1);
num = allkeynums(index);
end

