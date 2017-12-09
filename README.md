# Image-Dissimilarity-Check
Different Matlab algorithms to check image dissimilarity

## ColorDist1
ColorDist1 measures dissimilarity between two (24-bit color) images in term of their colors. Given two input images, ColorDist1 creates histograms of the red, green, and blue channels of each image, then measures the differences between the reds, the blues, and the greens (i.e., comparing red_hist from image1 with red_hist from image 2, and similar for green and blue). These are summed to form the output, an overall (scalar) dissimilarity measure.  Each histogram comprises 256 values, since each color band is an 8-bit image (8 bits each of red, green, and blue). The dissimilarity measure between two histograms is the Euclidian distance between the two normalized histogram vectors. To normalize the histogram, divide each entry by the total number of pixels in the image. (Thus all the values in the histogram should sum to one.)      

**Usage: >> [x hist1 hist2] = ColorDist1(image1, image2)**     
where image1 and image2 are color input images (not filenames, but N×M×3 uint8 color images). See Matlab documentation on how to create functions with multiple outputs – the above function.    

## Results1
Results1 runs ColorDist1 on the input images (from the test dataset on the Assignments page) and returns a table that shows the Dissimilarity Matrix.     

**Usage: >> dis_mat = Results1(images)**        

## ColorDist2
ColorDist2 measures image dissimilarity in another way: given two input images, it computes the Euclidian distance between the average R, G, and B values of the two images, producing a scalar measure of dissimilarity.       

**Usage: >> [x hist1 hist2] = ColorDist2(image1, image2)**     
where image1 and image2 are color input images (not filenames, but N×M×3 uint8 color images). See Matlab documentation on how to create functions with multiple outputs – the above function.    

## Results2
Results2 runs ColorDist2 on the input images (from the test dataset on the Assignments page) and returns a table that shows the Dissimilarity Matrix.     

**Usage: >> dis_mat = Results2(images)**   
![output1](https://github.com/zhanchengqian/Image-Dissimilarity-Check/blob/master/out1.png)

## ColorDist3
ColorDist3 measures dissimilarity between two (24-bit color) images using a 3D histogram. Given two input images, ColorDist3 creates a normalized 3D histogram of each image, then measures the difference between the two histograms, using Euclidian distance measure, to determine the output.

**Usage: >> [x hist1 hist2] = ColorDist3(image1, image2)**     
where image1 and image2 are color input images (not filenames, but rows×cols×3 uint8 color images) and N (an integer from 1 to 256) determines the bin size of the histogram.  

## Results3
Results3 runs ColorDist3 on the input images (from the test dataset on the Assignments page) and returns a table that shows the Dissimilarity Matrix.    

## EdgeDist1
EdgeDist1 measures image dissimilarity in another way: given two input images, it computes an edge orientation histogram E for each image, using only the Green array of each, and then compares E1 and E2 to provide an output dissimilarity measure. E is a vector with nine values: before normalization, they are the numbers of image pixels that have edge orientation close to the eight compass directions of N, NE, E, SE, S, SW, E, and NW (i.e., each bin includes an angular range of 360/8 = 45 degrees, centered on each of the compass directions). But only edges with magnitude > alpha are counted; those with magnitude < alpha are included in the final (ninth) element of E. After computing the initial values of E, normalize it so that entries sum to 1.0. 

**Usage: >> [x hist1 hist2] = EdgeDist1(image1, image2)**    
![output2](https://github.com/zhanchengqian/Image-Dissimilarity-Check/blob/master/out2.png)


