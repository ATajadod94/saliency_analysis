function hidx = get_index(im_name , number, img_name)
  name = im_name{:};
  name = lower(name);
  number = num2str(number);
  myimage = [number, '_' ,name ];
  hidx = find(strcmp([img_name(:)], myimage));
  if isempty(hidx)
        hidx = find(strcmp([img_name(:)], ['0',myimage]));
  end
  if isempty(hidx)
        hidx = find(strcmp([img_name(:)], ['00',myimage]));
  end
end
