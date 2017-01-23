sample = double(imread('Assignment2-images/test_im2.bmp'));
image = sample;
imshow(sample, []);
filled = double(sample > 0);
windowSize = 15;
j = 0;
while ~all(all(filled));
    j = j + 1;
    j
    PixelList = GetUnfilledNeighbors(filled);
    for i=1:numel(PixelList);
        [Template, ValidMask] = GetNeighborhoodWindow(PixelList{i}, image, windowSize, filled);
        [Matches, ssd] = Find(Template, sample, ValidMask);
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
imshow(image,[]);