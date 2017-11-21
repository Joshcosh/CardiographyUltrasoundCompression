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
            currBlockSize                   = ( 1 + rowBlockEnd - rowIndex ) * ( 1 + columnBlockEnd - columnIndex );     
            freqDomain_tempBlock            = zeros(1 + rowBlockEnd - rowIndex, 1 + columnBlockEnd - columnIndex);
            freqDomain_compressed_tempBlock = zeros(1 + rowBlockEnd - rowIndex, 1 + columnBlockEnd - columnIndex);
            inverse_tempBlock               = zeros(1 + rowBlockEnd - rowIndex, 1 + columnBlockEnd - columnIndex);
            inverse_compressed_tempBlock    = zeros(1 + rowBlockEnd - rowIndex, 1 + columnBlockEnd - columnIndex);

            freqDomain_tempBlock = imageHandle.freqDomain_static2DDct(rowIndex:rowBlockEnd, columnIndex:columnBlockEnd);
            freqDomain_compressed_tempBlock = imageHandle.compressed_Static2DDCT(rowIndex:rowBlockEnd, columnIndex:columnBlockEnd);
            % Do the dct conversion
            inverse_tempBlock = idct2(freqDomain_tempBlock);
            inverse_compressed_tempBlock = idct2(freqDomain_compressed_tempBlock);

            % Save them
            imageHandle.inverse_sanityCheck(rowIndex:rowBlockEnd, columnIndex:columnBlockEnd) = inverse_tempBlock;
            % Place the block in its correct matrix
            imageHandle.inverse_compressed_Static2DDCT(rowIndex:rowBlockEnd, columnIndex:columnBlockEnd) = inverse_compressed_tempBlock;
        end
    end
    imageHandle.inverse_sanityCheck = uint8(imageHandle.inverse_sanityCheck);
    imageHandle.inverse_compressed_Static2DDCT = uint8(imageHandle.inverse_compressed_Static2DDCT);
end