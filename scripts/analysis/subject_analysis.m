%% Creating a list of participants  from the fixation data
all_participants = participant.participants_from_fixations('/Users/Ali/Desktop/Baycrest/saliency_analysis/Data/RSVFixationReportOutput.csv');


%% Step 1 - setting basic fixation info on participant objects 
for participant = all_participants
     myparticipant = participant{:};
     myparticipant.set_trials();
end

for participant = all_participants
     myparticipant = participant{:};
     for trial_no = 1:myparticipant.NUM_TRIALS
        thistrial = myparticipant.TRIALS{trial_no};
        thistrial.fixationmap()
     end
end