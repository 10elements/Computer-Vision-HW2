function [ Template, ValidMask ] = GetNeighborhoodWindow( Pixel, image, windowSize, filled )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
[ir, ic] = size(image);
boundaryf = zeros(ir + 100, ic + 100);
boundaryf(51:ir + 50, 51: ic + 50) = filled;
boundaryImage = zeros(ir + 100, ic + 100);
boundaryImage(51:ir + 50, 51:ic + 50) = image;
PixelRow = Pixel(1) + 50;
PixelCol = Pixel(2) + 50;
top = PixelRow - (windowSize - 1) / 2;
bottom = PixelRow + (windowSize - 1) / 2;
left = PixelCol - (windowSize - 1) / 2;
right = PixelCol + (windowSize - 1) / 2;
Template = boundaryImage(top:bottom, left:right);
ValidMask = boundaryf(top:bottom, left:right);
end

