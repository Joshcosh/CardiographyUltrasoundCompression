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
            
            typeVec = [0 0 0];
            if ( imageHandle.roiBlocks(rowIndex,columnIndex) == 1 )
                typeVec(1) = 1;
            end
            if ( imageHandle.roniBlocks(rowIndex,columnIndex) == 1 )
                typeVec(2) = 1;
            end
            if ( imageHandle.hybridBlocks(rowIndex,columnIndex) == 1 )
                typeVec(3) = 1;
            end
            
            switch typeVec
                case [ 1 0 0 ]
                    
                case [ 0 1 0 ]
                    
                case [ 0 0 1 ]
                    
                otherwise
                    disp('Somthing is wrong with the maps');
            end
            % { Here we are in the current block }
            % Take the block
            % Take the roi
            % Do a dct to each column and aline it with the top row 
            currBlockSize = ( 1 + rowBlockEnd - rowIndex ) * ( 1 + columnBlockEnd - columnIndex );     
            tempBlock     = zeros(1 + rowBlockEnd - rowIndex, 1 + columnBlockEnd - columnIndex);
            tempBlockMask = zeros(1 + rowBlockEnd - rowIndex, 1 + columnBlockEnd - columnIndex);
            tempBlockShiftUp = zeros(1 + rowBlockEnd - rowIndex, 1 + columnBlockEnd - columnIndex, 2);
            tempBlockShiftLeft = zeros(1 + rowBlockEnd - rowIndex, 1 + columnBlockEnd - columnIndex, 2);
            
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
