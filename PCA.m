function [Vsub, TrainCoord] = PCA(TrainingData, range)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
%range is a vector [kmin, kmax]
[V, D] = eig(TrainingData.' * TrainingData);
[uselessVariable, permutation] = sort(diag(D));
permutation = flipud(permutation);
D = D(permutation, permutation); 
V = V(:, permutation);
Vsub = V(:, range(1):range(2));
TrainCoord = TrainingData*Vsub;
end

