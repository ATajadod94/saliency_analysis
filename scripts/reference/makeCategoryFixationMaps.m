function FDMs = makeCategoryFixationMaps(fixations)

subjects = unique({fixations.subject_number});
numSubjects = length(subjects);

categories = unique({fixations.scene_category});
numCats = length(categories);

imageSize = [600,800];

FDMs.subjects = subjects;
FDMs.categories = categories;
FDMs.subjIdx = [];
FDMs.catIdx = [];
FDMs.maps = [];
mapCounter = 1;

% loop over subjects
for s = 1:numSubjects

    fprintf('Processing subject %s (%d of %d) ...\n',subjects{s},s,numSubjects);
    
    %get an index of the fixations for this subject
    subjIdx = strmatch(subjects{s},{fixations.subject_number});
    
    % loop over categories
    for c = 1:numCats
        map = zeros(imageSize);
        
        % get index of all fixations for this category and for this subject
        catIdx = intersect(subjIdx,strmatch(categories{c},{fixations.scene_category}));
        
        % loop over all fixations for this category for this subject
        for f = 1:numel(catIdx)      
            x = fixations(catIdx(f)).fixation_x;
            y = fixations(catIdx(f)).fixation_y;
            d = fixations(catIdx(f)).fixation_duration; 
            map(y,x) = map(y,x) + d;
        end
        map = map / sum(map(:));
        FDMs.subjIdx(mapCounter) = s;
        FDMs.catIdx(mapCounter) = c;
        if mapCounter == 1
            FDMs.maps = map;
        else
            FDMs.maps(:,:,mapCounter) = map;  % maps(:,:,*), where * is each map...
        end
        mapCounter = mapCounter + 1;
    end
end
