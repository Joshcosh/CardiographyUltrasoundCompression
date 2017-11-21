function [ imageHandle ] = Static2DDCT( imageHandle )
% This function conducts a static 2D DCT process on a given image
    
    for rowIndex = 1:imageHandle.blockSize:imageHandle.rowSize
        rowBlockEnd = rowIndex + imageHandle.blockSize - 1;
        if rowBlockEnd > imageHandle.rowSize
            rowBlockEnd = imageHandle.rowSize;
        end
        
        for columnIndex = 1:imageHandle.blockSize:imageHandle.columnSize
            columnBlockEnd = columnIndex + imageHandle.blockSize - 1;

            if columnBlockEnd > imageHandle.columnSize
                columnBlockEnd = imageHandle.columnSize;
            end
            % { Here we are in the current block }
            % Take the block
            imageHandle = TransformBlock_Static2DDCT(imageHandle, rowIndex, rowBlockEnd, columnIndex, columnBlockEnd);
        end
    end
end