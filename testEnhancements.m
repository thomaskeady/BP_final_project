
%rgb = imread('2.png'); % Moderately effective at increasing bubble
%contrast
%rgb = imread('3.png'); % Pretty good
%rgb = imread('f.png'); % Big change, not sure if helps or hurts
%rgb = imread('k.png'); % BIG change, should definitely help
%rgb = imread('t.png'); % Another BIG change
%rgb = imread('u.png'); % Not sure if helps or hurts
%rgb = imread('u_noEdge.png'); % big change but may not help

% I = rgb2gray(rgb);
% 
% I_adj = imadjust(I);
% %imshow(I_adj);
% imshow([I, I_adj]);
% 
% disp('done');

%%%% Above this is all about testing individually
% Below is outputting all modified files to folder

image_src = 'OG';  % Alternative is 'cropped'
image_dest = 'im_adj' % Also what are you doig to this? Name location accordingly
image_ext = 'png':  % Don't include .

src = strcat('images/', image_src, '*.', image_ext);
dest = strcat('images/', image_src, '/', image_dest);

source = 

files = dir(src);
for file = files'
    I = rgb2gray(imread(file.name));
    i_adj = imadjust(I);
    imshow([I, I_adj]);
    imwrite(I_adj, 
end



