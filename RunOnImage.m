function [] = RunOnImage( imagePath )
    
    chanVeseImageHandle = Compression_Init(imagePath);
    
    
    % logFile     = logFile_Init();
    chanVeseImageHandle.blockSize = 16;
    chanVeseImageHandle.pRoi  = 0.8;
    chanVeseImageHandle.pRoni = 0.15;

    chanVeseImageHandle = ChooseRoiUsingChanVese(chanVeseImageHandle);
    chanVeseImageHandle = CreateMask(chanVeseImageHandle);
    % Initializations for compression
    
    chanVeseImageHandle = CalcCompressionRatio(chanVeseImageHandle);
    
    DisplayAllMapsTogether(chanVeseImageHandle);

    
    chanVeseImageHandle = Static2DDCT(chanVeseImageHandle);
%     chanVeseImageHandle = SADCT(chanVeseImageHandle);

    DisplayImage(chanVeseImageHandle.freqDomain_static2DDct,'static2DDct');
    DisplayImage(chanVeseImageHandle.compressed_Static2DDCT,'Compressed_Static2DDCT');

    chanVeseImageHandle = InverseStatic2DDCT(chanVeseImageHandle);
    DisplayImage(chanVeseImageHandle.inverse_sanityCheck,'inverse sanityCheck');
    DisplayImage(chanVeseImageHandle.inverse_compressed_Static2DDCT,'inverse compressed_Static2DDCT');

%     DisplayImage(chanVeseImageHandle.original, 'some string');

%     chanVeseImageHandle     = ChooseRoiManually( chanVeseImageHandle );
%     DisplayImage(chanVeseImageHandle.original, 'Original');
%     DisplayImage(chanVeseImageHandle.chosenRoiMask, 'Chosen Roi');
%     DisplayImage(chanVeseImageHandle.roiBlocksMask, 'RoiBlocks');
%     DisplayImage(chanVeseImageHandle.roniBlocksMask, 'RoniBlocks');
%     DisplayImage(chanVeseImageHandle.hybridBlocksMask, 'HybridBlocks');
%     DisplayImage(chanVeseImageHandle.hybridRoiMask, 'HybridRoi');
%     DisplayImage(chanVeseImageHandle.hybridRoniMask, 'HybridRoni');

    %     imageHandle = SADCT(imageHandle);
%     imageHandle = Static2DDCT(imageHandle);
%     imageHandle = Dynamic2DDCT(imageHandle);

    % Still needed:
    % Display image function
    % Run time analysis log file generator

end
