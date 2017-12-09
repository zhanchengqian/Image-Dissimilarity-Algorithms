function [x hist1 hist2] = EdgeDist1(image1, image2, a)
%%
    im1 = image1;   
    im1G = double(im1(:,:,2)); 
    [m1,n1] = size(im1G);
    hist1 = zeros(9);
%%
    im2 = image2;  
    im2G = double(im2(:,:,2));  
    [m2,n2] = size(im2G);
    hist2 = zeros(9);
%%
    resx = GxCal(im1G); resy = GyCal(im1G);
    for i = 2:m1+1
        for j = 2:n1+1
            index = Index(resx(i,j),resy(i,j),a);
            hist1(index) = hist1(index) + 1;
        end
    end
    
    for i = 1:9
        hist1(i) = hist1(i) / (m1*n1);
    end
    
    resx = GxCal(im2G); resy = GyCal(im2G);
    for i = 2:m2+1
        for j = 2:n2+1
            index = Index(resx(i,j),resy(i,j),a);
            hist2(index) = hist2(index) + 1;
        end
    end
    
    sum = 0;
    for i = 1:9
        hist2(i) = hist2(i) / (m2*n2);
        sum = sum + (hist1(i)-hist2(i))^2;
    end
    x = sqrt(sum);
    %fprintf('mean RGB of img1: %d, %d, %d\n',mean(im1R(:)),mean(im1G(:)),mean(im1B(:)));
    %fprintf('mean RGB of img2: %d, %d, %d\n',mean(im2R(:)),mean(im2G(:)),mean(im2B(:)));
end

function res = GxCal(mat)
    Gx = [-1 0 1;-2 0 2;-1 0 1];
    res = xcorr2(mat,Gx);
    %res = m(3,3);
end

function res = GyCal(mat)
    Gy = [ 1 2 1;0 0 0;-1 -2 -1];
    res = xcorr2(mat,Gy);
    %res = m(3,3);
end

function i = Index (x,y,a)
    mag = sqrt(x^2+y^2);
    theta = atan2d(y,x);
    if (mag >= a)
        if (theta >= 67.5 && theta < 112.5)
            i = 1; % N
        elseif (theta >= 112.5 && theta < 157.5)
                i = 8; % NW
        elseif (theta >= 157.5 || theta < -157.5)
                i = 7; % W
        elseif (theta >= -157.5 && theta < -112.5)
                i = 6; % SW
        elseif (theta >= -112.5 && theta < -67.5)
                i = 5; % S
        elseif (theta >= -67.5 && theta < -22.5)
                i = 4; % SE
        elseif (theta >= -22.5 && theta < 22.5)
                i = 3; % E  
        elseif (theta >= 22.5 && theta < 67.5)
                i = 2; % NE  
        end
    else 
        i = 9;
    end
end