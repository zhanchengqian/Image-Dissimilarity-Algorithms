function [x hist1 hist2] = ColorDist3(image1, image2, N)
%% Reading image 1
    hist1 = zeros(N, N, N);
    hist2 = zeros(N, N, N);
    

    
    im1 = image1;  
    im1R = im1(:,:,1);  
    im1G = im1(:,:,2);  
    im1B = im1(:,:,3);  

    [m1,n1]=size(im1R);
    rhist1=zeros(1,256);
    ghist1=zeros(1,256);
    bhist1=zeros(1,256); 

%% Reading image 2
    im2 = image2;  
    im2R = im2(:,:,1);  
    im2G = im2(:,:,2);  
    im2B = im2(:,:,3);  

    [m2,n2]=size(im2R);
    rhist2=zeros(1,256);
    ghist2=zeros(1,256);
    bhist2=zeros(1,256); 

%% Counting Pixels
    for k=1:m1
        for j=1:n1
        RVal1 = im1R(k,j); GVal1 = im1G(k,j); BVal1 = im1B(k,j); 
        x1 = floor(double(RVal1)/(256/N))+1; y1 = floor(double(GVal1)/(256/N))+1; z1 = floor(double(BVal1)/(256/N))+1;
        hist1(x1,y1,z1) = hist1(x1,y1,z1)+1;
        end
    end
    
    for k=1:m2
        for j=1:n2
        RVal2 = im2R(k,j); GVal2 = im2G(k,j); BVal2 = im2B(k,j); 
        x2 = floor(double(RVal2)/(256/N))+1; y2 = floor(double(GVal2)/(256/N))+1; z2 = floor(double(BVal2)/(256/N))+1;
        hist2(x2,y2,z2) = hist2(x2,y2,z2)+1;
        end
    end  
    
%% Normalization of hists
    a=0;
    for x=1:N
        for y=1:N
            for z=1:N
            hist1(x,y,z) = hist1(x,y,z)/(m1*n1);
            hist2(x,y,z) = hist2(x,y,z)/(m2*n2);
            a = a + (hist1(x,y,z)-hist2(x,y,z))^2;
            end 
        end
    end
    x = sqrt(a);
    
end