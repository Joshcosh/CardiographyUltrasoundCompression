function [ blockShiftedFreq, pixelsOfOrigin ] = AlignUpAndTransform( block, blockMask)
    %UNTITLED2 Summary of this function goes here
    %   Detailed explanation goes here
    blockRowSize = size(block, 1);
    blockColumnSize = size(block, 2);

    blockShifted = zeros(blockRowSize, blockColumnSize);
    blockShiftedFreq = zeros(blockRowSize, blockColumnSize);
    pixelsOfOrigin = zeros(blockRowSize, blockColumnSize, 2);

    nextRowInd = 1;
    nextColInd = 1;

    for column = 1:blockColumnSize
        for row = 1:blockRowSize
            if (blockMask(row,column) == 1)
                blockShifted(nextRowInd, nextColInd) = block(row, column);
                pixelsOfOrigin(nextRowInd, nextColInd, 1) = row;
                pixelsOfOrigin(nextRowInd, nextColInd, 2) = column;
                nextRowInd = nextRowInd + 1;
            end
        end
        blockShiftedFreq(1:(nextRowInd-1), column) = dct(blockShifted(1:(nextRowInd-1), column));
        nextRowInd = 1;
        nextColInd = nextColInd + 1;
    end
end

