load('b.mat');

F = fea;
G = gnd;
t = 10;
range = [1,3];
k=5;

h = classfreq(G);

[TestData, TrainingData] = DataSelect(t, F, G);

TestData = MeanIntensity(TestData);
TrainingData = MeanIntensity(TrainingData);

[Vsub, TrainCoord] = PCA(TrainingData, range);
%project test data on V sub
TestCoord = TestData*Vsub;



%k nearest neighbours...
[indices, distance] = knnsearch(TrainCoord, TestCoord, 'k', k); %index 