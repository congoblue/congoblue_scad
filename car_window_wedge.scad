
       // Those settings have to be identical to the box !!!
length      = 140;          // Width of the cover (outer dimension) 

//Definition of circle angular resolution
resol        = 36;           // Identical to housing !!!

difference () {

linear_extrude(20) polygon(points=[[0,0],[60,0],[60,10],[0,2]]);

  for (i=[1:2:60]) translate ([i,-0.5,-5]) cube ([1,1,30]);

}
 
