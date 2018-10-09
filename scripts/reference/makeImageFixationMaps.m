function imgFDMs = makeImageFixationMaps(fixations)

% "fixations" is ALL fixation data from all participants in a struct
% each row is a fixation, each column is a variable (i.e., image name, x and y locations, duration, etc.)

images = unique({fixations.image_name});   
numImages = length(images);

imageSize = [600,800];

imgFDMs.images = images;
imgFDMs.imgIdx = [];
imgFDMs.maps = [];
imgFDMs.imgMaps = [];
mapCounter = 1;

for i = 1:numImages
    fprintf('%s (%d of %d) ...\n',images{i},i,numImages);
    imgIdx = strmatch(images{i},{fixations.image_filename});
    
    map = zeros(imageSize);
    
     % loops over fixations and adds each one to the map, weighted by duration
    for f = 1:numel(imgIdx)
        x = fixations(imgIdx(f)).fixation_x;
        y = fixations(imgIdx(f)).fixation_y;
        d = fixations(imgIdx(f)).fixation_duration;
        map(y,x) = map(y,x) + d;
    end
    map = map / sum(map(:));
    imgFDMs.imgIdx(mapCounter) = i;
    if mapCounter == 1
        imgFDMs.maps = map;
    else
        imgFDMs.maps(:,:,mapCounter) = map;
    end
    mapCounter = mapCounter + 1;
end

avgMap = mean(imgFDMs.maps(:,:,:),3);

% similar to the saliency maps, but those were already smoothed so we only
% normalized; these ones get smoothed and normalized with one function
for m = 1:numImages 
    thisMap = imgFDMs.maps(:,:,m) - avgMap;
    smoothMap(:,:,m) = smoothNormalizeMap(thisMap);
end
imgFDMs.imgMaps = smoothMap;

end

% to get the nice colour map images:
% imagesc(imgFDMs.imgMaps(:,:,m)/max(imgFDMs.imgMaps(:))); caxis([-1 1]); colormap(jet);
% where m is a number that corresponds to an image



