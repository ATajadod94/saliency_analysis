folder_dir = '/Volumes/Work/Baycrest/saliency_analysis/Data/analysis_data';
for subject_num = [6,7,9]
    for i = 1:4
        file_name = ['/participant_', num2str(subject_num), '_', ...
            num2str(i), '.mat'];
        file_dir = [folder_dir, file_name];
        data = load(file_dir);
        data = data.temp;
        for j=1:length(data)
            data(j,5) = {imresize(data{j,2}, size(data{j,4}))};
            data(j,5) = {smoothNormalizeMap(data{j,5})};
            col_1 = data{j,4};
            col_2 = data{j,5};
            data(j,6) = {corr(col_1(:),col_2(:))};            
        end
        save(['participant_', num2str(subject_num), '_', num2str(i)],...
                'data', '-v7.3');
        
    end
    
end
