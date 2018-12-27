clear
%% Creating a list of participants  from the EDF data
participant_folder = '/Users/ryanlab/Desktop/AliT/Data/Repeated_Scene viewing_V1';
all_participants = dir(participant_folder);
all_participants = all_participants(3:end);




%% Step 1 - setting basic fixation info on participant objects
for p_num = 1:length(all_participants)
     myparticipant = all_participants(p_num);
     pnum = myparticipant.name;
     edf_file = strcat(myparticipant.folder,'/',myparticipant.name,'/',myparticipant.name,'.edf');
     try 
         myparticipant = participant(edf_file);
         myparticipant.set_trials();
         myparticipant.set_base();
         fname = char(strcat('participant_', string(pnum), '.mat'));
         save(char(fname) , 'myparticipant');
     catch
         continue
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