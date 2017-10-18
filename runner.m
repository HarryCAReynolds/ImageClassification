load('b.mat');

F = fea;
G = gnd;

h = classfreq(G);
N = length(h);
k=10;


range = [5,20];
accuracy = zeros(15,1);
Accuracy = zeros(15,1);

P

for s=1:50

for t =1:15
[TestData, TrainingData, GTest, GTrain] = DataSelect(t, F, G);

TestData = MeanIntensity(TestData);
TrainingData = MeanIntensity(TrainingData);

%%%%% Algorithm %%%%%
[Vsub, TrainCoord] = PCA(TrainingData, range);
%project test data on V sub
TestCoord = TestData*Vsub;



%k nearest neighbours...
[indices, distance] = knnsearch(TrainCoord, TestCoord, 'k', k); %index 

%%%%Validation%%%%%

results = zeros(t*N,1);
for i = 1:t*N
    I = indices(i, :);
    results(i) = sum(GTrain(I) == GTest(i));
end
accuracy(t) = sum(results>=k/2)/length(results);

%histogram(results);
end
Accuracy = Accuracy + accuracy;
end
figure 
plot(1:10, Accuracy/50);