close all
for study_i = 1:numel(studies)  
    study = studies(study_i);
    options = struct('xname',           'f',  ...
                     'yname',           'TS', ...
                     'plotResults', 	1, ... 
                     'printResults',	1, ... 
                     'axisType',        'semilogx', ... 
                     'lineStyle',       '-', ... 
                     'xLoopName',       'f', ...
                     'subFolderName',   '../results/PhD_S1_Sweep', ...
                     'legendEntries',   {{'method','M','parm','N'}}, ...
                     'noXLoopPrms',     0); 

    figure(2)
    printResultsToTextFiles(study,options)

    options.yname = 'error_p';
    options.axisType = 'loglog';

    figure(4)
    printResultsToTextFiles(study,options)

    options.yname = 'error_pAbs';
    options.axisType = 'loglog';

    figure(5)
    printResultsToTextFiles(study,options)
end