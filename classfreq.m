function h = classfreq(G)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
nbins = 1:1:max(G);
h = hist(G, nbins);%number of images in each class
end

