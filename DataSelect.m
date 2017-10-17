function [TestData, TrainingData] = DataSelect(t, F, G)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes ar
h = classfreq(G);
N = length(h); %number of classes
Vtest = zeros(N*t,1);
S = size(F); %total number of images x pixels
Vtrain = zeros(S(1)-N*t,1);
for i=1:N
    v = find(G==i);% indices of class i
    r = randsample(1:h(i), t); %randomly select t test data indices
    Vtest((i-1)*t+1: i*t) = v(r); %save them in Vtest
    v(r) = []; % clears the indices for test data, leaving training data in v
    
    if i==1
        Vtrain(1:(h(1) -t)) = v;
    else
        Vtrain(sum(h(1:i-1))-(i-1)*t+1: sum(h(1:i))-i*t) = v;
    end
end
TestData = F(Vtest, :);
TrainingData = F(Vtrain, :);
end

