% Copyright 2011 The MathWorks, Inc.
clear all
close all

%% Load STL mesh
% Stereolithography (STL) files are a common format for storing mesh data. STL
% meshes are simply a collection of triangular faces. This type of model is very
% suitable for use with MATLAB's PATCH graphics object.

% Import an STL mesh, returning a PATCH-compatible face-vertex structure
fv = stlread('../../../../../rhinoceros/BeTSSi/BeTSSi_mod_COMSOL_res2.stl');
% fv = stlread('../../../../../rhinoceros/BeTSSi/BeTSSi_mod_COMSOL_res100.stl');
% fv = stlread('../../../../../rhinoceros/BeTSSi/BeTSSi_mod_10cm.stl');
% fv = stlread('../../../../../rhinoceros/test.stl');
% fv = stlread('../../../../../../FFI/BeTSSiIIb/Model_Files/outer_hull/hull_20cmMesh.stl');


%% Render
% The model is rendered with a PATCH graphics object. We also add some dynamic
% lighting, and adjust the material properties to change the specular
% highlighting.

patch(fv,'FaceColor',       [0.8 0.8 1.0], ...
         'FaceLighting',    'gouraud',     ...
         'AmbientStrength', 0.15);
%          'EdgeColor',       'none',        ...

% Add a camera light, and tone down the specular highlighting
camlight('headlight');
material('dull');
ax = gca;               % get the current axis
ax.Clipping = 'off';    % turn clipping off
axis equal
axis off

% Fix the axes scaling, and set a nice view angle
% axis('image');
view([-135 35]);
for res = [10,5,2]
    [noElems,dofs,h_max, alpha_max, alpha_min] = computeMeshData(['../../../../../rhinoceros/BeTSSi/BeTSSi_mod_' num2str(res) 'cm.stl'])
end

for res = [1,2,4,8,16,32,64]
%     i
    if 1
        [noElems,dofs,h_max, alpha_max, alpha_min] = computeMeshData(['../../../../../rhinoceros/BeTSSi/BeTSSi_mod_COMSOL_res' num2str(res) '.stl'])
%         h_max = max([l1; l2; l3]);
%         h_max = max((l1 + l2 + l3)/3);
%         h_max = max(sqrt(l1.^2 + l2.^2 + l3.^2)/3);
%         f = 1000;
%         omega = 2*pi*f;
%         k = omega/1500;
%         lambda = 2*pi/k;
% %         res = round((h_max/lambda)^(-1))
%         res2 = (h_max/lambda)^(-1);
%         h_max
%         h_max = lambda/res
%         tau = max([l1; l2; l3])/lambda;
    else
        convertSTLtoBDF(['../../../../../rhinoceros/BeTSSi/BeTSSi_mod_COMSOL_res' num2str(res)])
    end
end

function [noElems, dofs, h_max, alpha_max, alpha_min] = computeMeshData(filename)


fv = stlread(filename);
tri = fv.faces;
P = fv.vertices;
noElems = size(tri,1);
dofs = size(P,1);

l1 = norm2(P(tri(:,1),:)-P(tri(:,2),:));
l2 = norm2(P(tri(:,1),:)-P(tri(:,3),:));
l3 = norm2(P(tri(:,2),:)-P(tri(:,3),:));
h_max = max(2*l1.*l2.*l3./sqrt((l1+l2+l3).*(l1+l2-l3).*(l1+l3-l2).*(l2+l3-l1)));

alpha1 = acos((l2.^2+l3.^2-l1.^2)./(2*l2.*l3));
alpha2 = acos((l1.^2+l3.^2-l2.^2)./(2*l1.*l3));
alpha3 = acos((l1.^2+l2.^2-l3.^2)./(2*l1.*l2));
alpha_max = 180*max([alpha1; alpha2; alpha3])/pi;
alpha_min = 180*min([alpha1; alpha2; alpha3])/pi;
% f = 1000;
% omega = 2*pi*f;
% k = omega/1500;
% lambda = 2*pi/k;
end
