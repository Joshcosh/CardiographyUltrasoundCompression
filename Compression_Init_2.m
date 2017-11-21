function [ imageHandle ] = Compression_Init(imagePath)

    % This function creates a kind of object that has all the functions and
    % variables needed for the compression process
    % [in]  imagePath        The path of the original image we wish to compress
    % [out] imageHandle      A handke to the object that contains all the functions and variables

    tempImage                = load( imagePath );

    % Variables' initializations
    imageHandle.original      = uint8( tempImage.ans );
    imageHandle.rowSize       = size(imageHandle.original, 1);
    imageHandle.columnSize    = size(imageHandle.original, 2);

    imageHandle.manuallyChosenRoiMask = zeros( imageHandle.rowSize, imageHandle.columnSize ); % Initialize chosen ROI mask 
    imageHandle.manualRoiMask         = zeros( imageHandle.rowSize, imageHandle.columnSize ); % Initialize ROI mask 
    imageHandle.manualRoniMask        = zeros( imageHandle.rowSize, imageHandle.columnSize ); % Initialize RONI mask (everything that isn't ROI) 
    imageHandle.manualHybridMask      = zeros( imageHandle.rowSize, imageHandle.columnSize ); % Initialize HYBRID mask (everything that isn't ROI)

    imageHandle.manuallyChosenRoi = zeros( imageHandle.rowSize, imageHandle.columnSize ); % Initialize image of chosen ROI 
    imageHandle.manualRoi         = zeros( imageHandle.rowSize, imageHandle.columnSize ); % Initialize image of ROI 
    imageHandle.manualRoni        = zeros( imageHandle.rowSize, imageHandle.columnSize ); % Initialize image of RONI 
    imageHandle.manualHybrid      = zeros( imageHandle.rowSize, imageHandle.columnSize ); % Initialize image of HYBRID 

    imageHandle.chanVeseFactor = 0.3;
    
    imageHandle.chanVeseChosenRoiMask = zeros( imageHandle.rowSize, imageHandle.columnSize ); % Initialize ROI mask  
    imageHandle.chanVeseRoiMask       = zeros( imageHandle.rowSize, imageHandle.columnSize ); % Initialize ROI mask 
    imageHandle.chanVeseRoniMask      = zeros( imageHandle.rowSize, imageHandle.columnSize ); % Initialize RONI mask (everything that isn't ROI) 
    imageHandle.chanVeseHybridMask    = zeros( imageHandle.rowSize, imageHandle.columnSize ); % Initialize HYBRID mask (everything that isn't ROI)
    
    imageHandle.chanVeseChosenRoi = zeros( imageHandle.rowSize, imageHandle.columnSize ); % Initialize ROI mask  
    imageHandle.chanVeseRoi       = zeros( imageHandle.rowSize, imageHandle.columnSize ); % Initialize ROI mask 
    imageHandle.chanVeseRoni      = zeros( imageHandle.rowSize, imageHandle.columnSize ); % Initialize RONI mask (everything that isn't ROI) 
    imageHandle.chanVeseHybrid    = zeros( imageHandle.rowSize, imageHandle.columnSize ); % Initialize HYBRID mask (everything that isn't ROI)
    
    
    imageHandle.freqDomain    = zeros( imageHandle.rowSize, imageHandle.columnSize ); % Initialize frequency domain image 

    imageHandle.ROIthreshold  = 0.9; % The ratio of ROI pixels in a block to be considered a PURE ROI
    imageHandle.RONIthreshold = 1; % The ratio of RONI pixels in a block to be considered a PURE RONI

    % Possible output initializations
    imageHandle.compressed_SADCT        = zeros( imageHandle.rowSize, imageHandle.columnSize ); % Initialize output SADCT
    imageHandle.compressed_Static2DDCT  = zeros( imageHandle.rowSize, imageHandle.columnSize ); % Initialize output Static 2DDCT
    imageHandle.compressed_Dynamic2DDCT = zeros( imageHandle.rowSize, imageHandle.columnSize ); % Initialize output Dynamic 2DDCT

    % % Variables for run time analysis
    % imageHandle.tic_CreateMask   = 0;
    % imageHandle.tic_SADCT        = 0;
    % imageHandle.tic_Static2DDCT  = 0;
    % imageHandle.tic_Dynamic2DDCT = 0;

    imageHandle.blockSize = 0; % Add an option for blocksize = entire image

    % Variables that define the compression rate
    imageHandle.pROI  = 0;
    imageHandle.pRONI = 0;
    
end
