function [k, distopt, range] = PCAOptions(F, G)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

% Choose k nearest neighbours
        disp('Choose k-nearest neighbour search options');
        
        %loop ensures k is positive integer 
        k= pi;
        while floor(k) ~= k && k <= 0
            k = input('Input the number of nearest neighbours (integer): ');
        end
        k = uint8(k);

% Forces users to choose one of the following metrics for knn search 
        disp('Choose metric for knn.')
        breakloop = 0;
        while breakloop ~= 1
            distopt = input('Type e for euclidean, s for standardised euclidean, c for chebychev distance or r for linear correlation: ', 's');
            
            switch distopt
                case 'e'
                    distanceoption = 'euclidean';
                    breakloop = 1;
                case 's'
                    distanceoption = 'seuclidean';
                    breakloop = 1;
                case 'c'
                    distanceoption = 'chebychev';
                    breakloop = 1;
                case 'r'
                    distanceoption = 'correlation';
                    breakloop = 1;
                otherwise
                    breakloop = 0;
            end
            
        end
% Choose PCA basis vectors for subspace        
        disp('Choose the range of eigenfaces (principal components) in PCA analysis');
        efacessample(F, G);
        a = pi;
        b = exp(1);
        while (floor(a) ~= a) && (floor(b) ~= b) && (a >= b)
            a = input('First face: ');
            b = input('Last face: ');
        end
        
        a = uint8(a);
        b = uint8(b);
        
        range = [a,b];
end

