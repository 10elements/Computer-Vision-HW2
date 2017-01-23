function [ PixelList ] = GetUnfilledNeighbors( filled )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
PixelList = cell(1, 1000);
% bi = double(image > 0);
% se = strel('square', 3);
se = ones(3);
% dilated = imdilate(bi, se);
convolved = conv2(filled, se, 'same');
neighbors = convolved .* ~filled;
% figure;
% imshow(neighbors);
% [B, I] = sort(neighbors(:), 'descend');
% indice = B > 0;
% [rows, cols] = ind2sub(size(neighbors), I(indice));
[rows, cols] = find(neighbors > 0);
for i = 1:numel(rows);
    PixelList{i} = [rows(i), cols(i)];
end
PixelList(numel(rows) + 1 : 1000) = [];
end

