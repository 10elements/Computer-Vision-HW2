image = zeros(200);
filled = zeros(200);
sample = double(imread('Assignment2-images/T1.gif'));
imshow(sample,[]);
[sRow, sCol] = size(sample);
seedRow = ceil(rand * (sRow - 2 - 1) + 1);
seedCol = ceil(rand * (sCol - 2 - 1) + 1);
% seedRow
% seedCol
image(99:101, 99:101) = sample(seedRow:seedRow + 2, seedCol:seedCol + 2);
filled(99:101, 99:101) = 1;
MaxErrThreshold = 0.3;
windowSize = 9;
j = 0;
while ~all(all(filled));
    j = j + 1;
    j
    progress = 0;
    PixelList = GetUnfilledNeighbors(filled);
    for i=1:numel(PixelList);
        [Template, filledTemplate] = GetNeighborhoodWindow(PixelList{i}, image, windowSize, filled);
        [Matches, ssd] = FindMatches(Template, sample, filledTemplate);
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
imshow(uint8(image));
