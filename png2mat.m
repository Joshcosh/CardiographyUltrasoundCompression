function [ ] = png2mat( folderPath, imageName )
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
im = imread(folderPath, '/', imageName);
imshow(im);
ans = rgb2gray(im);
% imshow(imGrayScale);
fileName = '/Users/Uri/Documents/Technion/10/Special_Project/Special_Project_code/bank_of_images/fetus_spine3.mat';
% fileName = 'fetus_spine3.mat';
save(fileName, 'ans');    

end

