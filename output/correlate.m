clear
participant_dir ='/Users/ryanlab/Desktop/AliT/Scripts/saliency_analysis/Participant_creation/participant_data';
map_dir ='/Users/ryanlab/Desktop/AliT/Scripts/saliency_analysis/saliencymap_creation/novelviewing_saliency';
addpath('/Users/ryanlab/Desktop/AliT/Scripts/ALItrack');
participants_fname = 'participant_';
p_files = dir(participant_dir);
p_files = p_files(6:end);
load('imgname.mat'); %findidx needs this
for pnum = 1:length(p_files)
    myparticipant = p_files(pnum);
    fname = [participant_dir,'/',myparticipant.name];
    savename = myparticipant.name;
    myparticipant = load(fname);
    myparticipant = myparticipant.myparticipant;
    % loop trials
    
    for trial_number = 1:myparticipant.NUM_TRIALS
        mytrial =  myparticipant(trial_number);
        mytrial.fixationmap();
        img_idx = findidx(mytrial.fixations.img_name{1,1},...
            img_name);
        img_fname = [map_dir,'/',num2str(img_idx),'_normalized.mat'];
        saliency_img =load(img_fname);
        mytrial.fixations.stimsaliency = smoothnormalize(saliency_img.norm_map);
        mytrial.fixations.map = imresize(mytrial.fixations.map,size(mytrial.fixations.stimsaliency));
        mytrial.fixations.corr = corr(mytrial.fixations.map(:),mytrial.fixations.stimsaliency(:));
        
        %save(fname , 'trial','-v7.3');
        
        mytrial.fixations.map = []; % don't want to overload the size of parti, so remove this data
        mytrial.fixations.stimsaliency = [];
    end
    
    save(savename , 'myparticipant','-v7.3');
end