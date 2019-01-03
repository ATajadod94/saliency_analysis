clear;
p_folder = '/Users/ryanlab/Desktop/AliT/Scripts/saliency_analysis/output/corr_data/';
participants = dir(p_folder);
participants = participants(5:end);
p_file = 'participant_';
output = {};
for participant_num = 1:length(participants)
    participant_info = participants(participant_num);
    pname = participant_info.name;
    disp(pname)
    myparticipant = load([participant_info.folder,'/',participant_info.name]);
    myparticipant = myparticipant.myparticipant;
    output{participant_num,1} = pname;
    for trial_num = 1:myparticipant.NUM_TRIALS
        output{participant_num,2} = trial_num;
        trial = myparticipant(trial_num);
        output{participant_num,2} = trial_num;
        output{participant_num,3} = trial.fixations.corr;
        output{participant_num,4} = trial.fixations.img_name;
        output{participant_num,5} = trial.fixations.novelty  ;   
    end
    T = cell2table(output,'VariableNames',{'pname','trial_number','correlation','image_name','novelty'});
    writetable(T,[pname,'.csv'])

end
