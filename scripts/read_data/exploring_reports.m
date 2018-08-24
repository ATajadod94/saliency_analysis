clear 
load('/Users/ryanlab/Desktop/AliT/Scripts/saliency_analysis/data/FixationReport.mat')

%% overview
disp(' First 5 rows: ' )
disp(RSVFixationReportOutput(1:5,:))

columns = RSVFixationReportOutput.Properties.VariableNames;

