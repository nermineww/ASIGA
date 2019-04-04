
for study_i = 1:numel(studies)  
    study = studies(study_i);
    options = struct('xname',           'alpha',  ...
                     'yname',           'TS', ...
                     'plotResults', 	1, ... 
                     'printResults',	1, ... 
                     'axisType',        'plot', ... 
                     'lineStyle',       '-', ... 
                     'subFolderName',   '../results/BCA_MS', ...
                     'legendEntries',   {{'method','coreMethod','formulation','M','degree','f'}}, ...
                     'noXLoopPrms',     0); 

    options.xScale = 180/pi;
    figure(4)
    printResultsToTextFiles(study,options)
end
T = readtable('../../FFI/BeTSSiIIb/Results/Data/WTD2/BC_HWBC_MS_AS_E0_F1.txt','FileType','text', 'HeaderLines',7);
x = T.Var1;
y = T.Var2;
plot(x,y,'DisplayName','WTD2')