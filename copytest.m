function Testimages = copytest(T, h, F)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
s = size(T); %T is index of image modulo class
N = s(1); %to get number of classes
H = zeros(N,1); %class shift
for i=1:N-1
    H(i+1)= sum(h(1:i));
end
T = T+H; %add class shift to indices modulo class
T = resize(T, [1, s(1)*s(2)]); % vector of indices to pull out in F
Testimages = F(T,:);
end

