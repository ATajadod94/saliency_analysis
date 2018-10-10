function CPdeepGazeMap = createDeepGazeMaps_CP(CPimgList)

CPdirectory = 'CP_deepgaze_output/';

for n = 1:240 % number of images/maps
    CPdeepGazeMap.imgIdx(n) = n;

    thisCPName = strcat(CPimgList(n).folder,'\',char(CPimgList(n).name));
    thisCPMap = imread(thisCPName);
    
    % resize and normalize map
    thisCPMap = imresize(thisCPMap, [1920,1080]);
    thisCPMap = im2double(thisCPMap);
    normCPMap = (thisCPMap-mean(thisCPMap(:)))/std(thisCPMap(:));
    
    % save maps
    CPdeepGazeMap.imgMaps(:,:,n) = normCPMap(:,:);
    
    clear thisCPMap thisCPName normCPMap
    
end
    