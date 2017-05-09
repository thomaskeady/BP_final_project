% Go from color image to circle with radius

input = '';

% Get rgb
rgb = imread(input);

% make gray
I = rbg2gray(rgb);

% hist
hist = histeq(I);

% OC50
se = strel('disk', 50);
Io = imopen(hist, se);
OC = imclose(Io, se);

% edge what kind??
%edgy = edge(OC);          % Sobel(last resort)
edgy = edge(OC, 'log');   % log
%edgy = edge(OC, 'canny'); % canny

% D10E15
seD = strel('disk', 10);
seE = strel('disk', 15);
eD = imdilate(edgy, seD);
eE = imerode(eD, seE);

%stats = regionprops('table', I, 'Area', 'PixelIdxList');
stats = regionprops('table', eE, 'Area', 'PixelList');

%disp(stats);

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
            eE(pix(2), pix(1)) = 0;
            
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
                xs = [xs, pix(1)];
                ys = [ys, pix(2)];
                
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
title(sprintf('Best fit: R = %0.1f', Rfit));
plot(xfit,yfit,'g.')
xlim([xfit-Rfit-2,xfit+Rfit+2])
ylim([yfit-Rfit-2,yfit+Rfit+2])
axis equal

