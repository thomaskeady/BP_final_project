
%Author : Athi Narayanan S
%M.E, Embedded Systems,
%K.S.R College of Engineering
%Erode, Tamil Nadu, India.
%http://sites.google.com/site/athisnarayanan/
%s_athi1983@yahoo.co.in

%Clear Memory & Command Window
clc;
clear all;
close all;

%nBins_select = 2:3:26;
%winSize_select = 5:2:25;
%Parameters for the Segmentation
nClass=6;

for nBins = 2:3:26
    for winSize = 5:2:25
        %Read Input Image
        inImg = imread('t.png');
        %imshow(inImg);title('Input Image');
        
        %Segmentation
        outImg = colImgSeg(inImg, nBins, winSize, nClass);
        
        %Displaying Output
        titleString = strcat('t nBins: ', int2str(nBins), '  winSize: ', int2str(winSize));
        
        figure;imshow(outImg);title(titleString);
        colormap('default');
        
    end
end


for nBins = 2:3:26
    for winSize = 5:2:25
        %Read Input Image
        inImg = imread('k.png');
        %imshow(inImg);title('Input Image');
        
        %Segmentation
        outImg = colImgSeg(inImg, nBins, winSize, nClass);
        
        %Displaying Output
        titleString = strcat('k nBins: ', int2str(nBins), '  winSize: ', int2str(winSize));
        
        figure;imshow(outImg);title(titleString);
        colormap('default');
        
    end
end


