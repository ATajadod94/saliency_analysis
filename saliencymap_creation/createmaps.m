%clear
%cc 

%% Step 1 -> create mapss 

imgdir = '/Users/ryanlab/Desktop/AliT/Data/vmoore/NovelSceneViewing';
images = dir(imgdir);
images = images(3:end);

for im_num = 1:length(images)
   map = makemaps(images(im_num));
   map.imgIdx = im_num;
   save([num2str(im_num),'.mat'],'map') 
end


