participant_dir ='/Users/ryanlab/Desktop/AliT/Scripts/saliency_analysis/Participant_creation/participant_data';
map_dir ='/Users/ryanlab/Desktop/AliT/Scripts/saliency_analysis/saliencymap_creation/novelviewing_saliency';
addpath('/Users/ryanlab/Desktop/AliT/Scripts/ALItrack');
participants_fname = 'participant_';


load('imgname.mat'); %findidx needs this
for participant_number = 1:15
    fname = [participant_dir,'/',participants_fname,num2str(participant_number),'.mat'];
    myparticipant = load(fname);
    myparticipant = myparticipant.myparticipant;
    % loop trials
    
    for trial_number = 1:myparticipant.NUM_TRIALS
        disp(trial_number);
        trial =  myparticipant(trial_number);
        trial.fixationmap();
        
        
        try
            img_idx = findidx(trial.fixations.image_name{1,1},...
                trial.fixations.raw{1,6}, ...
                img_name);
            img_fname = [map_dir,'/',num2str(img_idx),'_normalized.mat'];
            saliency_img =load(img_fname);
            trial.fixations.stimsaliency = smoothnormalize(saliency_img.norm_map);
            trial.fixations.map = imresize(trial.fixations.map,size(trial.fixations.stimsaliency));
            trial.fixations.corr = corr(trial.fixations.map(:),trial.fixations.stimsaliency(:));
            
            fname = char(strcat('participant_', string(participant_number),'_trial_',string(trial_number),'.mat'));
            %save(fname , 'trial','-v7.3');

            trial.fixations.map = []; % don't want to overload the size of parti, so remove this data
            trial.fixations.stimsaliency = [];
        catch
            continue
        end

    end
    
    fname = char(strcat('participant_', string(participant_number),'.mat'));
    save(fname , 'myparticipant','-v7.3');
end