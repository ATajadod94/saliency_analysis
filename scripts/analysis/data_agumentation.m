for participant_num  = [1:4,6:15]
    dirfolder = '/Users/Ali/Desktop/Baycrest/saliency_analysis/Data/Participants/';
    fname = strcat('mapparticipant_',num2str(participant_num));
    participant = load([dirfolder,fname]);
    participant = participant.myparticipant;
    analysis_data = cell(participant.NUM_TRIALS,4);
    
    for trial_no = 1:participant.NUM_TRIALS
        trial = participant.TRIALS(trial_no);
        try
            trial = trial{:};
        catch
            a = 2;
        end
        analysis_data{trial_no,1} = trial.fixations.image_name{1,1};
        analysis_data{trial_no,2} = trial.fixations.map;
        analysis_data{trial_no,3} = participant.AGE_GROUP;
        imgidx = get_index(cellstr(trial.fixations.image_name{1,1}), ...
        trial.fixations.raw{1,6},img_name); 
        heat_map = imgSMs.imgMaps(:,:,imgidx);
        analysis_data{trial_no,4} =  heat_map;
    end  
    save(['participant_',num2str(participant_num)],'analysis_data','-v7.3')

end

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