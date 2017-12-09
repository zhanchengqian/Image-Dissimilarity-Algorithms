function [x] = ColorDist2(image1, image2)
%%
    im1 = image1;  
    im1R = im1(:,:,1);  
    im1G = im1(:,:,2);  
    im1B = im1(:,:,3);  
%%
    im2 = image2;  
    im2R = im2(:,:,1);  
    im2G = im2(:,:,2);  
    im2B = im2(:,:,3);  
%%
    x = sqrt((mean(im1R(:))-mean(im2R(:)))^2+(mean(im1G(:))-mean(im2G(:)))^2+(mean(im1B(:))-mean(im2B(:)))^2);
    %fprintf('mean RGB of img1: %d, %d, %d\n',mean(im1R(:)),mean(im1G(:)),mean(im1B(:)));
    %fprintf('mean RGB of img2: %d, %d, %d\n',mean(im2R(:)),mean(im2G(:)),mean(im2B(:)));
end