
for study_i = 1:numel(studies)  
    study = studies(study_i);
    options = struct('xname',           'k',  ...
                     'yname',           'TS', ...
                     'plotResults', 	1, ... 
                     'printResults',	1, ... 
                     'axisType',        'semilogx', ... 
                     'lineStyle',       '-', ... 
                     'xLoopName',       'f', ...
                     'subFolderName',   '../results/_studies/Fillinger', ...
                     'legendEntries',   {{'method','M','parm','coreMethod'}}, ...
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