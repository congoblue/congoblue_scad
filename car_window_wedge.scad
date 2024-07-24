
length      = 45;          // Wedge length
height = 7; //thick end height
depth = 20; //extrude height


difference () {

linear_extrude(depth) polygon(points=[[0,0],[length,0],[length,height],[0,2]]);

  for (i=[1:2:length]) translate ([i,-0.5,-5]) cube ([1,1,30]);

}
 
