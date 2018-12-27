clear;
p_folder = '/Users/ryanlab/Desktop/AliT/Scripts/saliency_analysis/output/corr_data/';
p_file = 'participant_';
%output =  {'p_num','trial_num','age_group','num_fixations'};


for participant_num = 1:15
    myparticipant = load(strcat(p_folder,p_file,num2str(participant_num)));
    myparticipant = myparticipant.myparticipant;
    %entropy = trial.entroy();
    %ecurrence = trial.recurrence();
    myparticipant.to_csv('reminder.csv')
    for trial_num = 1:myparticipant.NUM_TRIALS
        trial = myparticipant(trial_num);
        
    end
end
