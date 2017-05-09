% Display properties from regionprops

image_src = 'cropped/hist/OC50/edge/canny/D10E15';  % Alternative is 'cropped'
image_name = '2_noEdge_hist_OC_edge_canny_D10E15';
image_ext = 'png';

I = imread(strcat('images/', image_src, '/', image_name, '.', image_ext));

%stats = regionprops('table', I, 'Area', 'PixelIdxList');
stats = regionprops('table', I, 'Area', 'PixelList');

disp(stats);

max = 0;

% Premature optimization is the root of all evil - 2:06AM, 5/9/17, t-minus
% 10 hours to presentation
% 

for i = 1:height(stats)
    if stats{i, 1} > max
        max = stats{i, 1};
    end 
end

for i = 1:height(stats)
    if stats{i, 1} ~= max
        p = stats{i, 2};
        list = p{1}';
        
        for pix = list
            disp(I(pix));
            temp = I(pix);
            disp(I(pix(2), pix(1)));
            temp2 = I(pix(2), pix(1));
            disp('next');
            
        end
    end
end 


% 
% x_length = size(I, 2);   % good
% 
% for i = 1:height(stats)
%     if stats{i, 1} ~= max
%         p = stats{i, 2};
%         list = p{1}';
%         
%         for pix = list
%             y = floor(pix / x_length) + 1;
%             
%             x = mod(pix, size(I, 1));
%             
%             I(x, y)
%             
%         end
%     end
% end            

%imshow(I);