%% Creating a list of participants  from the fixation data
all_participants = participant.participants_from_fixations('RSVFixationReportOutput.csv');


%% Step 1 - setting basic fixation info on participant objects
for participant = all_participants
     myparticipant = participant{:};
     myparticipant.set_trials();
end


pnum = 1;
for participant = all_participants
       myparticipant = participant{:};
       fname = char(strcat('participant_', string(pnum), '.mat'));
       save(char(fname) , 'myparticipant');
       pnum = pnum + 1;
end


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
