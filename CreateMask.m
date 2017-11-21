function [ imageHandle ] = CreateMask( imageHandle )
% This function create a mask of the entire image. 
% It uses the imageHandle.chosenROImask and divides them into 3 different
% masks - ROI, RONI and HYBRID.

    for rowIndex = 1:imageHandle.blockSize:imageHandle.rowSize
        
        % Find out where the current block ends. At the border line of the
        % image the blocks can be smaller than the chosen block size.
        rowBlockEnd    = rowIndex + imageHandle.blockSize - 1;
        if rowBlockEnd > imageHandle.rowSize
            rowBlockEnd = imageHandle.rowSize;
        end
        
        for columnIndex = 1:imageHandle.blockSize:imageHandle.columnSize
        
            % Find out where the current block ends. At the border line of the
            % image the blocks can be smaller than the chosen block size.
            columnBlockEnd = columnIndex + imageHandle.blockSize - 1;
            if columnBlockEnd > imageHandle.columnSize
                columnBlockEnd = imageHandle.columnSize;
            end

            % Sum up all the ones in this block. Each one represents
            % a pixel that is classified ROI.
            roiPixelsInCurrentBlock = sum(sum(imageHandle.chosenRoiMask(rowIndex:rowBlockEnd,columnIndex:columnBlockEnd)));
            % Check ROI Ratio in this block.
            nominator   = roiPixelsInCurrentBlock;
            denominator = ( rowBlockEnd - rowIndex + 1 ) * ( columnBlockEnd - columnIndex + 1  ); 

            blockRoiRatio = nominator / denominator;

            % Case this is a "PURE ROI" block
            if blockRoiRatio >= imageHandle.roiThreshold           
                imageHandle.roiBlocksMask(rowIndex:rowBlockEnd,columnIndex:columnBlockEnd) = 1;

            % Case this is a "PURE RONI" block
            elseif blockRoiRatio == 0                              
                imageHandle.roniBlocksMask(rowIndex:rowBlockEnd,columnIndex:columnBlockEnd) = 1;

            % Case this is a "HYBRID" block    
            else 
                imageHandle.hybridBlocksMask(rowIndex:rowBlockEnd,columnIndex:columnBlockEnd) = 1;
            end 
        end
    end

    % Some necessary casting
%     imageHandle.roiMask    = uint8(imageHandle.roiMask);
%     imageHandle.roniMask   = uint8(imageHandle.roniMask);
%     imageHandle.hybridMask = uint8(imageHandle.hybridMask);
    
    imageHandle.chosenRoniMask = imageHandle.chosenRoiMask == 0;
    imageHandle.hybridRoiMask  = imageHandle.chosenRoiMask .* imageHandle.hybridBlocksMask; 
    imageHandle.hybridRoniMask = imageHandle.chosenRoniMask .* imageHandle.hybridBlocksMask; 
    
    % Calculate imageHandle.roiRatio and imageHandle.roniRatio
    imageHandle.roiRatio = sum(imageHandle.chosenRoiMask(:)) / ( imageHandle.rowSize * imageHandle.columnSize );
    imageHandle.roniRatio = sum(imageHandle.chosenRoniMask(:)) / ( imageHandle.rowSize * imageHandle.columnSize );
end
