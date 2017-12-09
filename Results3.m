function [dis_mat] = Results3( images, N )
    n = length(images);
    dis_mat = zeros(n, n); % dissimilarity matrix
    torf = zeros(n, n); % 1 means have calculated dissimilarity of the comb
    hists = cell(1,n); % stores histogram of imgs
    %havecaled = zeros(1, n); % have calculated the histogram of this img
    
%%
	for row = 1:n
       dis_mat(row,row) = 0;
       torf(row,row) = 1;
    end
%%
    if (mod(n,2)==0)
        for row = 1:2:n
           col = row+1;
           img1 = images{row};
           img2 = images{col};
           [dis_mat(row,col) hist1 hist2] = ColorDist3(img1, img2, N);
           %havecaled(row) = 1;  havecaled(col) = 1;
           hists{row} = hist1;  hists{col} = hist2;
           dis_mat(col,row) = dis_mat(row,col);
           torf(row,col) = 1; torf(col,row) = 1;
           %fprintf('processing: %d, %d\n',row,col);
        end
    else
        for row = 1:2:n-1
           col = row+1;
           img1 = images{row};
           img2 = images{col};
           [dis_mat(row,col) hist1 hist2] = ColorDist3(img1, img2, N);
           %havecaled(row) = 1;  havecaled(col) = 1;
           hists{row} = hist1;  hists{col} = hist2;
           dis_mat(col,row) = dis_mat(row,col);
           torf(row,col) = 1; torf(col,row) = 1;
        end
        img1 = images{1};
        img2 = images{n};
        [dis_mat(row,col) hist1 hist2] = ColorDist3(img1, img2, N);
        hists{1} = hist1;  hists{n} = hist2;
        dis_mat(col,row) = dis_mat(row,col);
        torf(row,col) = 1; torf(col,row) = 1;
    end
 %%   
    for row = 1:n
       for col = 1:n
               if (torf(col,row)==1)
                   dis_mat(row,col) = dis_mat(col,row);
                   torf(row,col) = 1;
               else
                   hist1 = hists{row};
                   hist2 = hists{col};
                    a=0;
                    for x=1:N
                        for y=1:N
                            for z=1:N
                            a = a + (hist1(x,y,z)-hist2(x,y,z))^2;
                            end 
                        end
                    end
                   dis_mat(row,col) = sqrt(a); dis_mat(col,row) = dis_mat(row,col);
                   torf(row,col) = 1; torf(col,row) = 1;
               end
           %fprintf('row: %d, col: %d\n',row,col);
       end
    end
end

