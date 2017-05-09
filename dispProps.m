% Display properties from regionprops

image_src = 'cropped/hist/OC50/edge/canny/D10E15';  % Alternative is 'cropped'
image_name = 'k_noEdge_hist_OC_edge_canny_D10E15';
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
            %disp(I(pix(2), pix(1)));
            %temp2 = I(pix(2), pix(1));
            I(pix(2), pix(1)) = 0;
            
        end
    end
end 

xs = [];
ys = [];

for i = 1:height(stats)
    if stats{i, 1} == max
        p = stats{i, 2};
        list = p{1}';
        
        for pix = list
            rando = rand;
            if rando < 0.001
                xs = [xs, pix(2)];
                ys = [ys, pix(1)];
                
            end 
        end
    end
end 

[xfit,yfit,Rfit] = circfit(xs,ys);

figure
plot(xs,ys,'b.')
hold on
rectangle('position',[xfit-Rfit,yfit-Rfit,Rfit*2,Rfit*2],...
    'curvature',[1,1],'linestyle','-','edgecolor','r');
title(sprintf('Best fit: R = %0.1f; Ctr = (%0.1f,%0.1f)',...
    Rfit,xfit,yfit));
plot(xfit,yfit,'g.')
xlim([xfit-Rfit-2,xfit+Rfit+2])
ylim([yfit-Rfit-2,yfit+Rfit+2])
axis equal


%imshow(I);