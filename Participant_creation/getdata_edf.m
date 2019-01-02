clear
%% Creating a list of participants  from the EDF data
participant_folder = '/Users/ryanlab/Desktop/AliT/Data/Repeated_Scene viewing_V1';
all_participants = dir(participant_folder);
all_participants = all_participants(4:end);

skipped_files = {};


%% Step 1 - setting basic fixation info on participant objects
for p_num = 1:length(all_participants)
     myparticipant = all_participants(p_num);
     pnum = myparticipant.name;
     edf_file = strcat(myparticipant.folder,'/',myparticipant.name,'/',myparticipant.name,'.edf');
     dat_file = strcat(myparticipant.folder,'/',myparticipant.name,'/',"actual_Trials_DataSource_Repeated_Scene_viewing__Programming_BlocksTrials.dat");
     data = importdat(dat_file);
     
     try 
         myparticipant = participant(edf_file);
         myparticipant.set_trials();
         myparticipant.set_base();
         for trial_num = 1:myparticipant.NUM_TRIALS
             mytrial = myparticipant(trial_num);
             mytrial.fixations.img_name = data{trial_num,4};
             mytrial.fixations.novelty = data{trial_num,5};
         end
        fname = char(strcat('participant_', string(pnum), '.mat'));
         save(char(fname) , 'myparticipant');
     catch
         skipped_files = {skipped_files, all_participants(p_num)};
     end
end
%{
clear;
for pnum = 1:15
     fname = char(strcat('participant_', string(pnum), '.mat'));
     myparticipant = load(fname);
     myparticipant = myparticipant.myparticipant;
     for trial_no = 1:myparticipant.NUM_TRIALS
        thistrial = myparticipant.TRIALS{trial_no};
        thistrial.fixationmap()
     end
     fname = strcat('map',fname);
     save(char(fname) , 'myparticipant','-v7.3');
     myparticipant = [];
     clearvars -except pnum
end
%}