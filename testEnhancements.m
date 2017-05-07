
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

image_src = 'cropped';  % Alternative is 'cropped'
image_dest = 'edge/canny'; % Folder
image_mod = '_edge_canny'; % what does this do to it
image_ext = 'png';  % Don't include .

src = strcat('images/', image_src, '/');
dest = strcat(src, image_dest);

mkdir(dest);

se = strel('disk', 20);

files = dir(strcat(src, '*.', image_ext));
for file = files'
    I = rgb2gray(imread(strcat(src, file.name)));
    %I = imread(strcat(src, file.name));
    %I_adj = adapthisteq(I);
    %Io = imopen(I, se);
    %I_adj = imclose(Io, se);
    I_adj = edge(I, 'canny');
    
    
    %imshow([I, I_adj]);
    
    parts = strsplit(file.name, '.');
    newFile = strcat(dest, '/', parts(1), image_mod, '.', image_ext);
    disp(newFile);
    imwrite(I_adj, newFile{1});
end



