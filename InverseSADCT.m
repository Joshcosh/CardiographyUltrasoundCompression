function [ imageHandle ] = SADCT( imageHandle )
% This function conducts a static 2D DCT process on a given image
% initialize a 

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
            % 
            % Take the block
            % Take the roi
            % Do a dct to each column and aline it with the top row 
            currBlockSize = ( 1 + rowBlockEnd - rowIndex ) * ( 1 + columnBlockEnd - columnIndex );     
            tempBlock     = zeros(1 + rowBlockEnd - rowIndex, 1 + columnBlockEnd - columnIndex);
            freqDomain_tempBlock = zeros(1 + rowBlockEnd - rowIndex, 1 + columnBlockEnd - columnIndex);
            freqDomainCompressed = zeros(1 + rowBlockEnd - rowIndex, 1 + columnBlockEnd - columnIndex);
            
            
            tempBlock = imageHandle.original(rowIndex:rowBlockEnd, columnIndex:columnBlockEnd);
            
            % Do the dct conversion
            freqDomain_tempBlock = dct2(tempBlock);
%             imageHandle.
            % Calculate how many coeffs you want to save
            coeffsAmount = ceil(imageHandle.pixelsToSaveCoeff * currBlockSize);
            
            % Compress the block
            freqDomainCompressed = zigzagScan(freqDomain_tempBlock, coeffsAmount);

            % Save them
            imageHandle.freqDomain_SADCT(rowIndex:rowBlockEnd, columnIndex:columnBlockEnd) = freqDomain_tempBlock;
            % Place the block in its correct matrix
            imageHandle.compressed_SADCT(rowIndex:rowBlockEnd, columnIndex:columnBlockEnd) = freqDomainCompressed; 
        end
    end
end
