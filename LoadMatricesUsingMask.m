function [ imageHandle ] = LoadMatricesUsingMask( imageHandle )
% This function create a mask of the entire image. 
% It uses the imageHandle.chosenROImask and divides them into 3 different
% masks - ROI, RONI and HYBRID.

    % Load the ROI, ROI and HYBRID images using the masks
    imageHandle.roi    = imageHandle.original .* imageHandle.roiMask;
    imageHandle.roni   = imageHandle.original .* imageHandle.roniMask;
    imageHandle.hybrid = imageHandle.original .* imageHandle.hybridMask;

end
