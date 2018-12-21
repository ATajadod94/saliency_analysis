function hidx = findidx(im_name , number, img_name)
  name = string(im_name);
  name = lower(name);
  number = num2str(number);
  myimage = strcat(number, '_' ,name);
  hidx = find(strcmp(img_name(:), myimage));
  if isempty(hidx)
        hidx = find(strcmp(img_name(:), strcat('0',myimage)));
  end
  if isempty(hidx)
        hidx = find(strcmp(img_name(:), strcat('00',myimage)));
  end
end
