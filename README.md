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
**Usage: >> im_out = colorblur(image, component, N)**

## Results2
Results2 runs ColorDist2 on the input images (from the test dataset on the Assignments page) and returns a table that shows the Dissimilarity Matrix.     
**Usage: >> dis_mat = Results2(images)**   
