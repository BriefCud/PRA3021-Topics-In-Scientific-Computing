function evaluateModel()

close all;clear all;
load('DataLinearRegressionSimulation.mat');
[OptimalModelParameters, optimalModelorder, ModelOutput, A] = optimalARmodel(x,y);

%check the obtained output
 optimalModelorder
 OptimalModelParameters

end