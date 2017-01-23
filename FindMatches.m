function [ Matches, ssd] = FindMatches( Template, SampleImage, ValidMask )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
[windowSize, w] = size(Template);
m = double(~(SampleImage > 0));
GaussMask = fspecial('gaussian', windowSize, windowSize / 6.4);
GaussValid = ValidMask .* GaussMask;
TotalWeight = sum(sum(GaussValid));
SampleSqr = SampleImage .^ 2;
TemplateSqr = Template .^ 2;
Tsqr = sum(sum(TemplateSqr .* GaussValid));
F = 2 .* Template .* GaussValid;
TConv = conv2(SampleImage, F, 'same');
SConv = conv2(SampleSqr, GaussValid, 'same');
ssd = (SConv + Tsqr - TConv) ./ TotalWeight;
ssd(ssd < 0) = 0;
minssd = min(min(ssd));
[rows, cols] = find(ssd <= 1.1 * minssd);
% rows = rows + (windowSize - 1) / 2;
% cols = cols + (windowSize - 1) / 2;
Matches = cell(1, numel(rows));
for i = 1:numel(rows);
   Matches{i} = [rows(i), cols(i)]; 
end
end

