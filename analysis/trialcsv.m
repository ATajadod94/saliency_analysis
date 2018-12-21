clear;
p_folder = '/Users/ryanlab/Desktop/AliT/Scripts/saliency_analysis/correlation/corr_data/';
p_file = 'participant_';
%output =  {'p_num','trial_num','age_group','num_fixations'};

for participant_num = 1:15
    myparticipant = load(strcat(p_folder,p_file,num2str(participant_num)));
    myparticipant = load(strcat(p_folder,p_file,num2str(participant_num)));
    myparticipant = myparticipant.myparticipant;
    for trial_num = 1:myparticipant.Num_Trials
        %entropy = trial.entroy();
        %ecurrence = trial.recurrence();
        
        for trial_num = 1:myparticipant.NUM_TRIALS
            trial = myparticipant(trial_num);
            try
                corr_sum = corr_sum + trial.fixations.corr;
            catch
                myparticipant.NUM_TRIALS = myparticipant.NUM_TRIALS - 1;
            end
        end
    end
end