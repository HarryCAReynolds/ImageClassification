function [TestData, TrainingData, GTest, GTrain] = DataSelect(t, F, G)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes ar
h = classfreq(G);
N = length(h); %number of classes
Vtest = zeros(N*t,1);
S = size(F); %total number of images x pixels
Vtrain = zeros(S(1)-N*t,1);
for i=1:N
    v = find(G==i);% indices of class i
    r = randsample(1:length(v), t); %randomly select t test data indices
    Vtest((i-1)*t+1: i*t) = v(r); %save them in Vtest
    v(r) = []; % clears the indices for test data, leaving training data in v
    %Vtrain = indices of training data, the 'for loop' loops over the classes to save the indices of
    % the training set to Vtrain
    if i==1
        Vtrain(1:(h(1) -t)) = v; %comment!!!
    else
        Vtrain(sum(h(1:i-1))-(i-1)*t+1: sum(h(1:i))-i*t) = v;
    end
end
TestData = F(Vtest, :); %Pick out the testdata from F=image data set
GTest = G(Vtest); %index of image in G test = index of image in TestData; entry in Gtest is the classification of the image
TrainingData = F(Vtrain, :);% Pick out the training data from F= image data set 
GTrain = G(Vtrain);%index of image in GTrain = index fo image in TrainingData; entry in GTrain is the classification of the image
end

