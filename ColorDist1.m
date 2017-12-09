function [x hist1 hist2] = ColorDist1(image1, image2)
%%
    im1 = image1;  
    im1R = im1(:,:,1);  
    im1G = im1(:,:,2);  
    im1B = im1(:,:,3);  

    [m1,n1]=size(im1R);
    rhist1=zeros(1,256);
    ghist1=zeros(1,256);
    bhist1=zeros(1,256); 

%%
    im2 = image2;  
    im2R = im2(:,:,1);  
    im2G = im2(:,:,2);  
    im2B = im2(:,:,3);  

    [m2,n2]=size(im2R);
    rhist2=zeros(1,256);
    ghist2=zeros(1,256);
    bhist2=zeros(1,256); 

%%
    for k=0:255      
        count = length(find(im1R==k));
        rhist1(k+1)=count/(m1*n1);
    end  
    for k=0:255      
        count = length(find(im2R==k));
        rhist2(k+1)=count/(m2*n2);
    end  
%%  
    for k=0:255      
        count = length(find(im1G==k));
        ghist1(k+1)=count/(m1*n1);
    end  
    for k=0:255      
        count = length(find(im2G==k));
        ghist2(k+1)=count/(m2*n2);
    end  
%%  
    for k=0:255   
        count = length(find(im1B==k));
        bhist1(k+1)=count/(m1*n1);
    end  
    for k=0:255   
        count = length(find(im2B==k));
        bhist2(k+1)=count/(m2*n2);
    end  
%%
    hist1 = [rhist1;ghist1;bhist1]; 
    hist2 = [rhist2;ghist2;bhist2]; 

%%
    a=0;
    for k=0:255
       a = a + (rhist1(k+1) - rhist2(k+1))^2;
    end
    b=0;
    for k=0:255
       b = b + (ghist1(k+1) - ghist2(k+1))^2;
    end
    c=0;
    for k=0:255
       c = c + (bhist1(k+1) - bhist2(k+1))^2;
    end
    x = sqrt(a)+sqrt(b)+sqrt(c);
end