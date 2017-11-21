function [ imageHandle ] = TransformBlock_Static2DDCT(imageHandle, rowIndex, rowBlockEnd, columnIndex, columnBlockEnd)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
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
    imageHandle.freqDomain_static2DDct(rowIndex:rowBlockEnd, columnIndex:columnBlockEnd) = freqDomain_tempBlock;
    % Place the block in its correct matrix
    imageHandle.compressed_Static2DDCT(rowIndex:    rowBlockEnd, columnIndex:columnBlockEnd) = freqDomainCompressed; 

end

