function normMap = smoothNormalizeMap(map,sigma)

if nargin < 2
    sigma = 15;
end

%convolve maps with 2d Gaussian kernel
gauss_kernel = fspecial('gaussian',round(6*sigma*[1,1]),sigma);
conv_map = imfilter(map,gauss_kernel,'conv');  

%normalize map
normMap = (conv_map - mean(conv_map(:))) / std(conv_map(:));