function AlgOption = algorithmchoice()
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

bl =0;
while bl ~= 1
    disp('Type P for a principal component analysis + k-nearest neighbour search, or...');
    AlgOption = input('Type L for a linear discriminant analysis classification: ', 's');
    if AlgOption == 'P' || AlgOption == 'p' || AlgOption == 'L' || AlgOption == 'l'
        bl =1 ;
    else
        bl = 0;
    end
end

end

