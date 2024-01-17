================================================================================

  1. Motivation

================================================================================

  These codes are the work 1 by the author pursuing his master's degree in University of jinan.

================================================================================

  2. File contents

================================================================================

  Folder name: LBF+SSR, LIF+SSR and LSACM+SSR

  Main Matlab M file:
		Demo.m
		admmLasso_mat_func.m
		compute_c.m
		compute_s.m
		compute_b.m
		TwoPhase.m
		Heaviside.m
		kappa.m
		Mask.m

  Image file:
		Images are chosen from Weizmann database and Berkeley segmentation data set 500(BSDS500).

================================================================================

  3. Main M file functions

================================================================================

   a) Demo.m	: demos
   b) admmLasso_mat_func.m	: compute the sparse self-representation matrix
   c) compute_c.m	: compute the mean of region
   d) compute_s.m	: compute the variance of region
   e) compute_b.m	: compute the bias field of image
   f) TwoPhase.m	: update the level set function
   g) Heaviside.m	: Heaviside function
   h) Dirac.m	: Dirac function
   i) kappa.m	: calculate image curvature 
   j) Mask.m	: calculate the binary image of segmentation result

Demo is written in switch structure, please execute case one by one.
All other functions above are called by the main function: Demo.

================================================================================

  4.  Installations and notes

================================================================================

  Installations
   a) Extract files folder to your computer
   b) Add a path in Matlab for this folder
  
  Notes:
   a) Codes have been tested under Windows 10, with 8G memory and 
      Intel(R) Core(TM) i5-10500 CPU. Run time for each case is about 200-500
      sec. It may take longer run time for worse configurations. No test 
      in MAC system.
   b) These codes passed the tests under MATLAB 2019b and might
       be not compatiable with older versions.
   c) Make sure your MATLAB contains IMAGE PROCESSING TOOLBOX,
      because some codes call built-in functions in that toolbox.
   d) All images contained in the folder come from Weizmann database
      and Berkeley segmentation data set 500(BSDS500)..

=============================================================================  
   
  5.  Play with codes

=============================================================================

   a) Open Demo.m and execute codes with each case.
   b) After you get known what's going on, try to revise parameters and
      see what happens.
   c) Furthermore, find some other images to play with.

=============================================================================

   6. Author info

=============================================================================
   
   a) Name      : Peng Xue
   b) Email	: pengxue224@163.com
   c) Addreass  : School of Information Science and Engineering 
                  University of jinan
	  336 South Xinzhuang West Road
                  Jinan, Shandong Province, China

=============================================================================

								END OF FILE

=============================================================================