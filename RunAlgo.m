% This script serves as a kind of a main func for the code. 
% We state the path of the image or images we want to compress and send the
% path name to the RunOnImage func.


% Load path and image title
imagePath = '/Users/Uri/Documents/Technion/10/Special_Project/Special_Project_code/bank_of_images';
heartImageTitle = 'im1C.mat';
fetusImageTitle = 'fetus_spine3.mat';
% Run the compression algorithm on the image
% RunOnImage( [ imagePath, '/', heartImageTitle ] );
RunOnImage( [ imagePath, '/', fetusImageTitle ] );