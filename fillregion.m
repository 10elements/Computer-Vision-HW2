function [ image ] = fillregion( sample , windowSize)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
image = sample;
% imshow(sample, []);
filled = double(sample > 0);
j = 0;
while ~all(all(filled));
    j = j + 1;
    j
    PixelList = GetUnfilledNeighbors(filled);
    for i=1:numel(PixelList);
        [Template, ValidMask] = GetNeighborhoodWindow(PixelList{i}, image, windowSize, filled);
        Matches = Find(Template, sample, ValidMask);
        randPick = ceil(rand *(numel(Matches) - 1) + 1);
        Match = Matches{randPick};
        PixelRow = PixelList{i}(1);
        PixelCol = PixelList{i}(2);
        MatchRow = Match(1);
        MatchCol = Match(2);
        image(PixelRow, PixelCol) = sample(MatchRow, MatchCol);
        filled(PixelRow, PixelCol) = 1;
    end
end
end

