function DataNorm = MeanIntensity(Data)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
S = size(Data); %S(1) is number of rows = number of faces in data
mean = sum(Data, 1)/S(1);
DataNorm = Data - repmat(mean, [S(1),1]);
end

