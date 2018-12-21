clear
imgdir = '/Users/ryanlab/Desktop/AliT/Scripts/saliency_analysis/analysis/novelviewing_saliency';

avgmap = load('meanmap.mat');
avgmap = avgmap.mean;
sum_maps = zeros(1080,1920);
for im_num = 1:240
    map = load(num2str(im_num),'map');
    map = map.map.map;
    norm_map = map-avgmap;
    norm_map = (norm_map - mean(norm_map(:))) / std(norm_map(:));
    save([num2str(im_num),'_normalized','.mat'],'norm_map') 
end

