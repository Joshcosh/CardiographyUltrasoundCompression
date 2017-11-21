function [ imageHandle ] = ChooseRoiManually( imageHandle )
% This function allows to choose the ROI using the mouse.
% Also it saves the chosen ROI area to the imageHandle.ROImask.
% Currently the function allows to only choose a rectangle. 
% Will be added - Mark a general region using the mouse.

% To choose a rectangle area:
% rect = getrect;
% disp(rect(:));

% To choose a poligonal area:

poli = roipoly;
imageHandle.chosenROImask = uint8(poli);

imageHandle.chosenROI = imageHandle.original .* imageHandle.chosenROImask;
% imageHandle.ChosenROI = imageHandle.original; % Another method to do the create the chosen ROI image.
% imageHandle( imageHandle.chosenROImask == 0 ) = 0;

end