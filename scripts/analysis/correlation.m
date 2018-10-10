load('all_participants.mat');
load('imagesms_saliency');
for participant = all_participants
    participant = participant{:};
    raw_data = participant.RAW;
    analysis_data = cell(participant.NUM_TRIALS,4);
    
    for trial_no = 1:participant.NUM_TRIALS
        trial = participant.TRIALS(trial_no);
        trial = trial{:};
        analysis_data{trial_no,1} = trial.fixations.image_name{1,1};
        analysis_data{trial_no,2} = trial.fixations.map;
    end
    
    
end