function colorMoments = colorMoments(rgbImage)
rgbImage = imread('C:\Users\vandana\Desktop\ashish.jpg');
rgbImage=im2double(rgbImage);
% Display the original image.
figure;
subplot(2, 4, 1);
imshow(rgbImage, []);
title('Original RGB image');

% Convert to HSV color space
hsv = rgb2hsv(rgbImage);


% Extract out the individual channels.
h = hsv(:,:,1);
s = hsv(:,:,2);
v = hsv(:,:,3);

% Display the individual channels.
subplot(2, 4, 2);
imshow(h, []);
title('Hue Image');
subplot(2, 4, 3);
imshow(s, []);
title('Saturation Image');
% sImage_Mean = mean(satImage(:));
% caption = sprintf('Saturation Image. Mean = %6.2f', sImage_Mean);
%title(caption, 'FontSize', fontSize);
subplot(2, 4, 4);
imshow(v, []);
title('Value Image');

% Take histograms
[hCount, hValues] = hist(h(:), 18);
[sCount, sValues] = hist(s(:), 3);
[vCount, vValues] = hist(v(:), 3);

% Plot histograms.
subplot(2, 4, 5);
bar(hValues, hCount);
title('Hue Histogram');
subplot(2, 4, 6);
bar(sValues, sCount);
title('Saturation Histogram');
subplot(2, 4, 7);
bar(vValues, vCount);
title('Value Histogram');
h=h*360;
[M,N,O]=size(hsv);

H=floor(h * (1-eps) / 20);
figure;
u=hist(H(:));
disp('Hue');
disp(u);
subplot(2, 2, 1);
hist(H(:),max(H(:)));
title('Hue Histogram');


S=zeros(size(hsv,1),size(hsv,2));
x=hist(S);
disp('Saturation');
disp(x);
subplot(2, 2, 2);
hist(S(:));
title('Saturation Histogram');
V = zeros(M,N);
vplaces = v > 0.25;
V(vplaces & s <= 0.2) = 3;
V(vplaces & s <= 0.126) = 2;
V(vplaces & s <= 0.67) = 1;

y=hist(V);
disp('Value');
disp(y);
subplot(2, 2, 3);
hist(V(:));
title('Value Histogram');


for i = 1:M
      for j = 1:N
            if s(i,j)>0.2&&s(i,j)<=0.65
                S(i,j)=0;
            end
            if s(i,j)>0.65&&s(i,j)<=1
                S(i,j)=1;
            end
      end
end

 for i=1:M
     for j=1:N
         if s(i,j)>0.2&&s(i,j)<=1&&v(i,j)>0.25&&v(i,j)<=1
             q(i,j)=9*H(i,j)+3*S(i,j)+V(i,j)+4;
            
         end
        
     end
    
 end
  figure;
  hist(q(:),max(q(:))); 

st_d1=std(double(rgbImage));
sk1=skewness(double(rgbImage));
m=mean(double(rgbImage));
meanh = mean( H(:) )
means = mean( S(:) )
meanv = mean( V(:) )
stdh  = std( H(:) )
stds  = std( S(:) )
stdv  = std( V(:) )
skh  = skewness( H(:) )
sks  = skewness( S(:) )
skv  = skewness( V(:) )
