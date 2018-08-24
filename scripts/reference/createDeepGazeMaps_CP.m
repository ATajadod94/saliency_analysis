function CPdeepGazeMap = createDeepGazeMaps_CP(CPimgList)

CPdirectory = 'CP_deepgaze_output/';

for n = 1:432 % number of images/maps
    CPdeepGazeMap.imgIdx(n) = n;

    thisCPName = strcat(CPdirectory,char(CPimgList(n)));
    thisCPMap = imread(thisCPName);
    
    % resize and normalize map
    thisCPMap = imresize(thisCPMap, [600 800]);
    thisCPMap = im2double(thisCPMap);
    normCPMap = (thisCPMap-mean(thisCPMap(:)))/std(thisCPMap(:));
    
    % save maps
    CPdeepGazeMap.imgMaps(:,:,n) = normCPMap(:,:);
    
    clear thisCPMap thisCPName normCPMap
    
end
    