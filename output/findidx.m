function hidx = findidx(im_name , img_name)
  name = string(im_name);
  name = lower(name);
  myimage = im_name(1:end-4);
  hidx = find(strcmp(img_name(:), myimage));
  if isempty(hidx)
        hidx = find(strcmp(img_name(:), strcat('0',myimage)));
  end
  if isempty(hidx)
        hidx = find(strcmp(img_name(:), strcat('00',myimage)));
  end
end
