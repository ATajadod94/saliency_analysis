clear;
p_folder = '/Users/ryanlab/Desktop/AliT/Scripts/saliency_analysis/correlation/corr_data/';
p_file = 'participant_';
output = {};
for participant_num = 1:15
    myparticipant = load(strcat(p_folder,p_file,num2str(participant_num)));
    myparticipant = myparticipant.myparticipant;
    output{participant_num,1} = participant_num;
    output{participant_num,2} = myparticipant.AGE_GROUP;
    corr_sum = 0;
    for trial_num = 1:myparticipant.NUM_TRIALS
        trial = myparticipant(trial_num);
        try
            corr_sum = corr_sum + trial.fixations.corr;
        catch
            myparticipant.NUM_TRIALS = myparticipant.NUM_TRIALS - 1;
        end
    end
    corr_mean = corr_sum/myparticipant.NUM_TRIALS;
    output{participant_num,3} = corr_mean; 
end
output = {'p_num','age_group','correlation'};
T = cell2table(output(2:end,:),'VariableNames',output(1,:));
writetable(T,'myDataFile.csv')
