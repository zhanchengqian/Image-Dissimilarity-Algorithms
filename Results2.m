function [dis_mat] = Results2( images )
    n = length(images);
    dis_mat = zeros(n, n); % dissimilarity matrix
%%
	for row = 1:n
       dis_mat(row,row) = 0;
    end
%%
    for row = 1:n
       for col = (row+1):n
           img1 = images{row}; img2 = images{col};
           dis_mat(row,col) = ColorDist2(img1, img2);
           dis_mat(col,row) = ColorDist2(img1, img2);
       end
    end
end

