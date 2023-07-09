%% Simple image processing

% Constants
gaus_sigma = 0.01;
gaus_mean = 0;

%% Original image and grayscale

% Read an image
myImage = imread('peppers.png');

% Convert to grayscale
myImageGS = rgb2gray(myImage);

% Plot the two images
f = figure;
subplot(1,2,1);
imshow(myImage);
subplot(1,2,2);
imshow(myImageGS);


%% Gaussian noise

% Add gaussain white noise to the original and grayscale images
I = imnoise(myImage,'gaussian',gaus_mean,gaus_sigma); 
Igray = imnoise(myImageGS,'gaussian',gaus_mean,gaus_sigma);

% Plot the new two image
f2 = figure;
subplot(1,2,1);
imshow(I);
subplot(1,2,2);
imshow(Igray);


%% Plot everything together
f3 = figure;
subplot(2,2,1);
imshow(myImage);
title('original')
subplot(2,2,2);
imshow(myImageGS);
title('grayscale')
subplot(2,2,3);
imshow(I);
title('original with noise')
subplot(2,2,4);
imshow(Igray);
title('grayscale with noise')

disp('Work complete!');