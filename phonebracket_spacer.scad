// Definition size of housing
// **************************

width_x      = 17;     
depth_y      = 9.5;    
height_z     = 10;


difference () {

  cube ( [width_x, depth_y, height_z], center = true );
  translate([0,0,-8]) rotate ([30,0,0]) cube ( [width_x+1, depth_y+10, 10], center = true );
   

};
