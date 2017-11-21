function [ imageHandle ] = CalcCompressionRatio( imageHandle )

roiCoeff = imageHandle.roiRatio * imageHandle.pRoi;
roniCoeff = imageHandle.roniRatio * imageHandle.pRoni;

imageHandle.pixelsToSaveCoeff = roiCoeff + roniCoeff;

end

