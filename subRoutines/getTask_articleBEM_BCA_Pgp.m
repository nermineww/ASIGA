

scatteringCase = 'BI'; % 'BI' = Bistatic scattering, 'MS' = Monostatic scattering

model = 'BCA_P'; % BeTSSi submarine
coreMethod = 'IGA';
   
plot3Dgeometry = 0;
plot2Dgeometry = 0;  % Plot cross section of mesh and geometr

% f = [5e2, 1e3]; %[1e2 5e2 1e3];             % Frequency
f = 1e2; %[1e2 5e2 1e3];             % Frequency
alpha = (0:0.05:360)*pi/180;

plotResultsInParaview = 0;
plotMesh              = 0;	% Create additional Paraview files to visualize IGA mesh
plotTimeOscillation   = 0;	% Create 30 paraview files in order to visualize a dynamic result
calculateSurfaceError = true;
calculateFarFieldPattern = false;

BC = 'NBC';

applyLoad = 'radialPulsation';
method = {'BEM'};
formulation = {'CCBIE','CRCBIE1','CRCBIE3'};
M = 1;
storeSolution = false;
storeFullVarCol = false;
loopParameters = {'method','degree','extraGPBEM','formulation','agpBEM'};
degree = [2,6];

runTasksInParallel = false; % extra quadrature points
extraGP = 0; % extra quadrature points
extraGPBEM = [4,8,16,32]; % extra quadrature points
agpBEM = [0.2,0.3,0.4,0.5,0.6,0.7,0.8];
collectIntoTasks

agpBEM = agpBEM([1,end]);
extraGPBEM = NaN;
method = {'BA'};
formulation = {'SL2E'};
collectIntoTasks
