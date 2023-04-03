% Author: Usama Mehmood, Graduate Student, Stony Brook University, NY, US
% email address: umehmood@cs.stonybrook.edu 
% Website: https://usamamehmood.weebly.com
% November 2014; Last revision: 23-Nov-2017
%
% Copyright (C) 2014, by Usama Mehmood
% Work done under supervision of Dr. Sohaib Ahmad Khan 
%%

clc
clear
close all

%% Load 3D point Data into columns X, Y, Z
% Box.mat and Box_other.mat have sample 3D point data.
dir = '3D Point Data/';
% fname = 'Box.mat';
% load([dir fname]);

% fname = 'sphere.obj';
% result = read_wobj([dir fname]);
% vertices = result.vertices;
% X = vertices(:, 1);
% Y = vertices(:, 2);
% Z = vertices(:, 3);

fname = '1.csv';
points3D = csvread([dir fname]);
X = points3D(:,1);
Y = points3D(:,2);
Z = points3D(:,3);
% points3D = [X Y Z]


%% RANSAC
[model, CuboidParameters, inlierIndices, outlierIndices] = CuboidRANSAC( points3D );

%% PLot Cuboid with the point cloud where inliers are colored blue, and outliers red.
scatter3(X(inlierIndices), Y(inlierIndices), Z(inlierIndices),...
    5, 'b', 'Marker', '.', 'SizeData', 100);
scatter3(X(outlierIndices), Y(outlierIndices), Z(outlierIndices),...
    5, 'r', 'Marker', '.', 'SizeData', 100);
DisplayModel(numel(inlierIndices), model);



