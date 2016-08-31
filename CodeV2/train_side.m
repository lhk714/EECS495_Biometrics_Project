function [ MeanFace_side,eigenVector_side,coefficient_side ] = train_side()
NumOfIms = 22;
NumOfEigenVectors = 20;
str_Path = '/Users/HKLHK/Documents/MATLAB/Bio Proj/PCA/Training/';
for i = 1: NumOfIms
    str_Load = strcat(str_Path, num2str(i), '.jpeg');
    Image = loadImg(str_Load);
    grayImage = rgb2gray(Image);
    TrainingImage(:,i) = double(reshape(grayImage, [ ], 1));
end
[ MeanFace_side,eigenVector_side,coefficient_side ] = PCAtraining( TrainingImage,20 );
eigenVector_side=eigenVector_side(:,1:NumOfEigenVectors);
end

