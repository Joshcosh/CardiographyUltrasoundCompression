function [ blockShiftedFreq, pixelsOfOrigin ] = AlignLeftAndTransform( block, blockMask)
    %UNTITLED2 Summary of this function goes here
    %   Detailed explanation goes here
    blockRowSize = size(block, 1);
    blockColumnSize = size(block, 2);

    blockShifted = zeros(blockRowSize, blockColumnSize);
    blockShiftedFreq = zeros(blockRowSize, blockColumnSize);
    pixelsOfOrigin = zeros(blockRowSize, blockColumnSize, 2);
    
    nextRowInd = 1;
    nextColInd = 1;

    for row = 1:blockRowSize
        for column = 1:blockColumnSize
            if (blockMask(row,column) == 1)
                blockShifted(nextRowInd, nextColInd) = block(row, column);
                pixelsOfOrigin(nextRowInd, nextColInd, 1) = row;
                pixelsOfOrigin(nextRowInd, nextColInd, 2) = column;
                nextColInd = nextColInd + 1;
            end
        end
        blockShiftedFreq(row, 1:(nextColInd-1)) = dct(blockShifted(row, 1:(nextColInd-1)));
        nextColInd = 1;
        nextRowInd = nextRowInd + 1;
    end
end

