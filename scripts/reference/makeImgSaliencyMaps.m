function imgSMs = makeImgSaliencyMaps(images)

% this function makes a saliency map for each image in "images" 
% "images" is a cell array, where each cell contains the name of an image
% the output is a struct with three fields:
%   1) images - the same cell array with image names
%   2) image index - an index of images (sometimes useful for later analyses)
%   3) imgMaps - these are the saliency maps for each image - 800x600 (image size) x 432 (number of images in my set)

numImages = length(images);

imgSMs.images = images;
imgSMs.imgIdx = [];
mapCounter = 1;

% saliency map parameters (this is a Saliency Toolbox function)
params = defaultSaliencyParams;

% loop over images
for i = 1:numImages
    fprintf('Processing image %d of %d ...\n',i,numImages);
    
    im = char(images(i).name);
    im = im(1:find(im=='.',1,'last')-1);
    
    % get the image from the directory that contains your images
    imCall = strcat(images(i).folder, '/',im,'.jpg');
    
    % initializes the image properties (this is a Saliency Toolbox function)
    img = initializeImage(imCall);
    
    % now make the saliency map (this is also a ST function)
    salmap = makeSaliencyMap(img, params);
    
    % the toolbox shrinks the image, so I resize it to its original size
    map = imresize(salmap.data,img.size(1:2));
    
    % to be honest, I forget why we have this in here. It just makes the
    % values of the map smaller (probably to avoid extreme values)
    map = map/sum(map(:));
    
    % adds each maps a map struct
    imgSMs.imgIdx(mapCounter) = i;
    if mapCounter == 1
        maps = map;
    else
        maps(:,:,mapCounter) = map;
    end
    mapCounter = mapCounter + 1;
end

% calculates the average of all image maps
avgMap = mean(maps(:,:,:),3);

% now loops over the maps and substracts the average map from each image map
% then it normalizes (z-scores the maps)
% this way, positive scores now reflect more salient locations across ALL
% maps, and negative scores are the less salient locations across all maps
for m = 1:240
    thisMap = maps(:,:,m) - avgMap;
    normMap(:,:,m) = (thisMap - mean(thisMap(:))) / std(thisMap(:));
end
% now adds the finalized maps to the output struct
imgSMs.imgMaps = normMap;

end
