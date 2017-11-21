function [ ] = DisplayAllMapsTogether( imageHandle )
% DisplayAllMapsTogether displays all the maps together.
% Each map is assigned a color and so it allows to understand division
% with a single glance. 

% Defign colors
roiColor    = [1 1 0.5];
roniColor   = [1 0.5 1];
hybridColor = [0.5 1 1];

roiBlocksMask = imageHandle.roiBlocksMask;     
roiBlocksMaskRgb = double(cat(3, roiBlocksMask * roiColor(1), roiBlocksMask * roiColor(2), roiBlocksMask * roiColor(3)));

roniBlocksMask = imageHandle.roniBlocksMask;     
roniBlocksMaskRgb = double(cat(3, roniBlocksMask * roniColor(1), roniBlocksMask * roniColor(2), roniBlocksMask * roniColor(3)));

hybridBlocksMask = imageHandle.hybridBlocksMask;     
hybridBlocksMaskRgb = double(cat(3, hybridBlocksMask * hybridColor(1), hybridBlocksMask * hybridColor(2), hybridBlocksMask * hybridColor(3)));

hybridRoiMask = imageHandle.hybridRoiMask;
hybridRoiMaskRgb = double(cat(3, hybridRoiMask * roiColor(1), hybridRoiMask * roiColor(2), hybridRoiMask * roiColor(3)));

hybridRoniMask = imageHandle.hybridRoniMask;
hybridRoniMaskRgb = double(cat(3, hybridRoniMask * roniColor(1), hybridRoniMask * roniColor(2), hybridRoniMask * roniColor(3)));



mergedMask = roiBlocksMaskRgb(:,:,:) + roniBlocksMaskRgb(:,:,:) + hybridBlocksMaskRgb(:,:,:);
figure;
imshow(mergedMask);
title('All Block Masks Together');
hold on;

figure;
mergedHybridPixelsMask = hybridRoiMaskRgb(:,:,:) + hybridRoniMaskRgb(:,:,:);
imshow(mergedHybridPixelsMask);
title('All Hybrid Pixels Masks Together');
hold on;

end

