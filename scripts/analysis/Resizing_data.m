folder_dir = '/Volumes/Work/Baycrest/saliency_analysis/Data/analysis_data';
for subject_num = 9:15
    file_name = ['/participant_', num2str(subject_num), '.mat'];
    file_dir = [folder_dir, file_name];
    load(file_dir)
    starts = linspace(1,length(analysis_data),5);
    ends =  linspace(1,length(analysis_data),5);
    for i = 1:3
        temp = analysis_data(floor(starts(i)):floor(ends(i+1)-1),:);
        save(['participant_', num2str(subject_num), '_', num2str(i)],...
                    'temp', '-v7.3');             
    end
    i= i+1;
    temp = analysis_data(floor(starts(4)):floor(ends(5)),:);
    save(['participant_', num2str(subject_num), '_', num2str(i)],...
                    'temp', '-v7.3');       
end
