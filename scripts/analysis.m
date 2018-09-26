%% Creating a list of participants  from the fixation data
all_participants = participant.participants_from_fixations('C:\Users\alire\Documents\GitHub\saliency_analysis\data\RSVFixationReportOutput');


%% Step 1 - setting basic fixation info on participant objects 
for participant = all_participants
     myparticipant = participant{:};
     myparticipant.set_trials();
end

for participant = all_participants
     myparticipant = participant{:};
    
     for trial = myparticipant.TRIALS
        thistrial = trial{:};
     end
end