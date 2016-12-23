image= 'C:\Users\vandana\Desktop\mca\project code 4th sem\images1';
  file = dir(fullfile(image, '*.jpg'));  
 totimages = numel(file);    
 for i = 1: totimages
  name= fullfile(image, file(i).name);         
images = imread(name)
featureVector = colorMoments(rgbImage)





