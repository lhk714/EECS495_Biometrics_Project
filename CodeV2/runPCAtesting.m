display('*****************************************')
display('*****************************************')
display('*****************************************')
display('Test: Load the address of the test front face...')

str_Load_test_front = '/Users/HKLHK/Documents/MATLAB/Bio Proj/PCA/Testing/3.jpeg';

display('Test: Start testing front face')
display('Test: Please wait...')

[ index_front] = test_front( str_Load_test_front,MeanFace_front,eigenVector_front,coefficient_front);

display('Test: Front face matching complete')
display('-----------------------------------------')
display('Plots: The first face from the left is the test front face followed by three top matched front faces')

%plots
figure('name','Front face matching');
subplot(1,4,1);
subimage(loadImg(str_Load_test_front));

str_Path_front_matching = '/Users/HKLHK/Documents/MATLAB/Bio Proj/PCA/Training/';
for i=1:3
    str_Load_recon_front = strcat(str_Path_front_matching, num2str(index_front(i)), '.jpeg');
    subplot(1,4,i+1);
    subimage(loadImg(str_Load_recon_front));
end
%plots


display('*****************************************')
display('*****************************************')
display('*****************************************')
display('Test: Load the address of the test side face...')

str_Load_test_side = '/Users/HKLHK/Documents/MATLAB/Bio Proj/PCA/Testing/3.jpeg';

display('Test: Start testing side face')
display('Test: Please wait...')

[ index_side] = test_side( str_Load_test_side,MeanFace_side,eigenVector_side,coefficient_side);

display('Test: Side face matching complete')
display('-----------------------------------------')
display('Plots: The first face from the left is the test side face followed by three top matched side faces')

%plots
figure('name','Side face matching');
subplot(1,4,1);
subimage(loadImg(str_Load_test_side));

str_Path_side_matching = '/Users/HKLHK/Documents/MATLAB/Bio Proj/PCA/Training/';
for i=1:3
    str_Load_recon_side = strcat(str_Path_side_matching, num2str(index_side(i)), '.jpeg');
    subplot(1,4,i+1);
    subimage(loadImg(str_Load_recon_side));
end
%plots

display('*****************************************')
display('*****************************************')
display('*****************************************')
display('-----------------------------------------')

display('Test: Start front + side matching, find the most frequent index')

Idx_set = [index_front index_side];
[Idx_match freq] = mode(Idx_set);

if freq<=1
    errordlg('Can not find match!','Error')
else
    display('Plot: Left is test face, right is matched face')
    
    %plot
    figure('name','Final matching result');
    subplot(1,2,1);
    subimage(loadImg(str_Load_test_front));
    str_Load_recon_final = strcat(str_Path_front_matching, num2str(Idx_match), '.jpeg');
    subplot(1,2,2);
    subimage(loadImg(str_Load_recon_final));
    %plot
end
display('*****************************************')
display('*****************************************')
display('*****************************************')
