load('b.mat');

F = fea;
G = gnd;

h = classfreq(G);
N = length(h);

disp('Choose image classification algorithm');

AlgOption = algorithmchoice();

if AlgOption == 'P'
    [k, distopt, range] = PCAOptions(F, G);
end



T = -pi;
while floor(T) ~= T &&  (T > 59 || T < 0)
    T = input('Choose the number of test images to draw from each class (< 59): ');
end
T = double(T);

accuracy = zeros(T,1);
Accuracy = zeros(T,1);


S = -pi;
while floor(S) ~= S && S < 1
    S = input('Choose the number of test runs: ');
end
S = double(S);


for s=1:S

for t =1:T
    
[TestData, TrainingData, GTest, GTrain] = DataSelect(t, F, G);
TestData = MeanIntensity(TestData);
TrainingData = MeanIntensity(TrainingData);

switch AlgOption
    case 'P'
        %%%%% PCA Algorithm %%%%%
        [Vsub, TrainCoord] = PCA(TrainingData, range);
        %project test data on V sub
        TestCoord = TestData*Vsub;



        %k nearest neighbours...
        [indices, distance] = knnsearch(TrainCoord, TestCoord, 'k', k, 'Distance', distanceoption); %index 

        %%%%Validation%%%%%

        results = zeros(t*N,1);
        for i = 1:t*N
            I = indices(i, :);
            results(i) = sum(GTrain(I) == GTest(i));
        end
        accuracy(t) = sum(results>=k/2)/length(results);
    case 'L'
        Model = fitcdiscr(TrainingData, GTrain);
        predictionlabels = predict(Model, TestData);
        accuracy(t) = sum(GTest == predictionlabels)/length(GTest);
end

%histogram(results);
end
Accuracy = Accuracy + accuracy;
end

Accuracy = Accuracy/S;
disp(['Success rate is ' num2str(Accuracy(T)*100) ' % for ' num2str(N*T) ' test images, ' num2str(length(G) - N*T) ' training images. '])
figure
plot(1:T, Accuracy);