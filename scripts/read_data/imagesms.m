imgdir = '/Users/Ali/Desktop/Baycrest/saliency_analysis/Data/NovelSceneViewing';
images = dir(imgdir);
images = images(3:end);

imgSMs = makeImgSaliencyMaps(images);