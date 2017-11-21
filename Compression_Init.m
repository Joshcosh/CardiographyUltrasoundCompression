function [ imageHandle ] = Compression_Init(imagePath)

    % This function creates a kind of object that has all the functions and
    % variables needed for the compression process
    % [in]  imagePath        The path of the original image we wish to compress
    % [out] imageHandle      A handke to the object that contains all the functions and variables
 
    tempImage                = load( imagePath );

    % Variables' initializations
    imageHandle.original      = uint8( tempImage.ans );
    imageHandle.rowSize       = size( imageHandle.original, 1 );
    imageHandle.columnSize    = size( imageHandle.original, 2 );

    imageHandle.chosenRoiMask    = zeros( imageHandle.rowSize, imageHandle.columnSize ); % A mask of all the roi pixels 
    imageHandle.chosenRoniMask   = zeros( imageHandle.rowSize, imageHandle.columnSize ); % A mask of all the roni pixels
    imageHandle.roiBlocksMask    = zeros( imageHandle.rowSize, imageHandle.columnSize ); % A mask of all the roi blocks 
    imageHandle.roniBlocksMask   = zeros( imageHandle.rowSize, imageHandle.columnSize ); % A mask of all the roni blocks
    imageHandle.hybridBlocksMask = zeros( imageHandle.rowSize, imageHandle.columnSize ); % A mask of all the hybrid blocks
    imageHandle.hybridRoiMask    = zeros( imageHandle.rowSize, imageHandle.columnSize ); % A mask of all the hybrid blocks
    imageHandle.hybridRoniMask   = zeros( imageHandle.rowSize, imageHandle.columnSize ); % A mask of all the hybrid blocks
    imageHandle.hybridGradientBlocksMask = zeros( imageHandle.rowSize, imageHandle.columnSize ); % A mask of all the hybrid blocks
    imageHandle.hybridGradientRoiMask    = zeros( imageHandle.rowSize, imageHandle.columnSize ); % A mask of all the hybrid blocks
    imageHandle.hybridGradientRoniMask   = zeros( imageHandle.rowSize, imageHandle.columnSize ); % A mask of all the hybrid blocks
    
    imageHandle.chosenRoi    = zeros( imageHandle.rowSize, imageHandle.columnSize ); % A of all the roi pixels
    imageHandle.chosenRoni   = zeros( imageHandle.rowSize, imageHandle.columnSize ); % A of all the roni pixels 
    imageHandle.roiBlocks    = zeros( imageHandle.rowSize, imageHandle.columnSize ); % A of all the roi blocks 
    imageHandle.roniBlocks   = zeros( imageHandle.rowSize, imageHandle.columnSize ); % A of all the roni blocks 
    imageHandle.hybridBlocks = zeros( imageHandle.rowSize, imageHandle.columnSize ); % A of all the hybrid blocks
    imageHandle.hybridRoi    = zeros( imageHandle.rowSize, imageHandle.columnSize ); % A of all the roi pixels is the hybrid blocks
    imageHandle.hybridRoni   = zeros( imageHandle.rowSize, imageHandle.columnSize ); % A of all the roni pixels is the hybrid blocks
    imageHandle.hybridGradientBlocks = zeros( imageHandle.rowSize, imageHandle.columnSize ); % A of all the hybrid blocks
    imageHandle.hybridGradientRoi    = zeros( imageHandle.rowSize, imageHandle.columnSize ); % A of all the roi pixels is the hybrid blocks
    imageHandle.hybridGradientRoni   = zeros( imageHandle.rowSize, imageHandle.columnSize ); % A of all the roni pixels is the hybrid blocks
    
    imageHandle.freqDomain_SADCT       = zeros( imageHandle.rowSize, imageHandle.columnSize ); % Initialize frequency domain image 
    imageHandle.pixelsOfOrigin_SADCT   = zeros( imageHandle.rowSize, imageHandle.columnSize , 2); % (:,:,1) = rows of origin | (:,:,2) = column of origin
    imageHandle.freqDomain_static2DDct = zeros( imageHandle.rowSize, imageHandle.columnSize ); % Initialize frequency domain image 
    imageHandle.freqDomain    = zeros( imageHandle.rowSize, imageHandle.columnSize ); % Initialize frequency domain image 
    
    % Possible output initializations
    imageHandle.compressed_SADCT        = zeros( imageHandle.rowSize, imageHandle.columnSize ); % Initialize output SADCT
    imageHandle.compressedPixelsShiftUp   = zeros( imageHandle.rowSize, imageHandle.columnSize , 2); % (:,:,1) = rows of origin | (:,:,2) = column of origin
    imageHandle.compressedPixelsShiftLeft   = zeros( imageHandle.rowSize, imageHandle.columnSize , 2); % (:,:,1) = rows of origin | (:,:,2) = column of origin
    imageHandle.compressed_Static2DDCT  = zeros( imageHandle.rowSize, imageHandle.columnSize ); % Initialize output Static 2DDCT
    imageHandle.compressed_Dynamic2DDCT = zeros( imageHandle.rowSize, imageHandle.columnSize ); % Initialize output Dynamic 2DDCT

    % Possible output initializations
    imageHandle.inverse_sanityCheck        = zeros( imageHandle.rowSize, imageHandle.columnSize ); % Initialize output SADCT
    imageHandle.inverse_compressed_SADCT        = zeros( imageHandle.rowSize, imageHandle.columnSize ); % Initialize output SADCT
    imageHandle.inverse_compressed_Static2DDCT  = zeros( imageHandle.rowSize, imageHandle.columnSize ); % Initialize output Static 2DDCT
    imageHandle.inverse_compressed_Dynamic2DDCT = zeros( imageHandle.rowSize, imageHandle.columnSize ); % Initialize output Dynamic 2DDCT

    
    imageHandle.blockSize = 0; % Add an option for blocksize = entire image
    imageHandle.roiThreshold  = 0.9; % The ratio of ROI pixels in a block to be considered a PURE ROI
    imageHandle.roniThreshold = 1; % The ratio of RONI pixels in a block to be considered a PURE RONI
    
    % Variables that define the compression rate
    imageHandle.roiRatio  = 0;
    imageHandle.roniRatio = 0;
    imageHandle.pRoi  = 0;
    imageHandle.pRoni = 0;
    
    imageHandle.pixelsToSaveCoeff = 0;
    
    imageHandle.chanVeseFactor = 0.3;
    
    
    % % Variables for run time analysis
    % imageHandle.tic_CreateMask   = 0;
    % imageHandle.tic_SADCT        = 0;
    % imageHandle.tic_Static2DDCT  = 0;
    % imageHandle.tic_Dynamic2DDCT = 0;
    
end
