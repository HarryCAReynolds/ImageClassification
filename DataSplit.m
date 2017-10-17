function [outputArg1,outputArg2] = DataSplit(t, F, G)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
h = classfreq(G);
s = size(h);
N = s(2); %number of classes
tmin = min(h); %59 in data set
if t < tmin
    TestData = testdataselect(t, h); %gives the indices of the test data

else 
    disp('Number of test images/class greater than number of images per class!');
end


end

