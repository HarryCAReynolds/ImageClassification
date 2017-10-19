function [] = efacessample(F, G)

range = [1,50];
maxeface = 50;

[Vsub1, Coord] = PCA(F, range);

Vsub1=Vsub1./mean(Vsub1);

for i=1:maxeface
subplot(5,10,i);
imshow(uint8(reshape(Vsub1(:,i),32,32)));
title(i)
end

end