scatteringCase = 'BI';

model = 'Shirron';  % Spherical shell

coreMethod = 'IGA';


c_f = 1500;  % Speed of sound in fluid domains
k = 10;
omega = k*c_f;
f = omega/(2*pi);

parm = [];
alpha = (0:0.1:180)*pi/180;
% alpha = (0:10:180)*pi/180;
alpha_s = [180,90]*pi/180;
% alpha_s = 180*pi/180;
beta_s = 0;

plot2Dgeometry = 0;
plot3Dgeometry = 0;
degree = 3;
calculateSurfaceError = 0;
computeCondNumber = false;
calculateFarFieldPattern = 1;
applyLoad = 'planeWave';

loopParameters = {'M','N','formulation','method','f','alpha_s'};

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% IE simulation
M = 4:5;
method = {'IE'};
formulation = {'BGU'};
N = [3,5,7];
% N = 3;
collectIntoTasks

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% IENSG simulation
% M = 1:6;
method = {'IENSG'};
% N = [1,3,5,7,9];
collectIntoTasks

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% BEM simulation
method = {'BEM'};
% M = 2;
N = NaN;
formulation = {'CBM','GBM'};
solveForPtot = true;
collectIntoTasks