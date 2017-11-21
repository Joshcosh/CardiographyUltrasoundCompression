function [ imageHandle ] = ChooseRoiUsingChanVese( imageHandle )
% This function chooses the ROI using the Chen-Vese Algorithm.
% Also it saves the chosen ROI area to the imageHandle.ROImask.

    R = imageHandle.chanVeseFactor;

    imageMean    = double(mean(imageHandle.original(:)));
    imageMax     = double(max(imageHandle.original(:)));
    threshold    = imageMean * (1 - R) + imageMax * R;

    tempMask = imageHandle.original > threshold;
%     DisplayImage(tempMask, 'imBin');

    tempMaskImFill = imfill(tempMask, 'holes');
%     DisplayImage(tempMaskImFill, 'imBin -> imfill');

    p = imageHandle.blockSize;
    tempMaskBwareaopen = bwareaopen(tempMask, p);
%     DisplayImage(tempMaskBwareaopen, 'imBin -> bwareaopen');
%     
%     figure(1);
%     imshowpair(tempMask, tempMaskImFill, 'montage');
%     title('tempMask, tempMaskImFill');
% 
%     figure(2);
%     imshowpair(tempMask, tempMaskBwareaopen, 'montage');
%     title('tempMask, tempMaskBwareaopen');
%     
%     figure(3);
%     imshowpair(tempMaskImFill, tempMaskBwareaopen, 'montage');
%     title('tempMaskImFill, tempMaskBwareaopen');
%     
    
    imageHandle.chosenRoiMask = tempMask;

end