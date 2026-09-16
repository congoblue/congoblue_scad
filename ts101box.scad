// Definition size of housing
// **************************

       // Those settings have to be identical to the cover !!!
width_x      = 180;          // Width of the housing (outer dimension) 
depth_y      = 73;           // depth of the housing (outer dimension)
height_z     = 22.5;           // Height of the lower part. 

//Definition of circle angular resolution
resol        = 36;

y_ctr = 12.5; //ypos of iron recess
x_end = 5; //xpos of iron end


difference () {

// Construction of housing
   roundedcube([width_x, depth_y, height_z],false,2);
    
// Space for the construction of holes, breakouts, ... 
    
   //sleeve
   translate([x_end+90, y_ctr-18/2,22.5-18]) cube([20,18,18]);
    
   //body
   translate([x_end+0, y_ctr-14/2,22.5-15]) cube([90,14,15]); 

   //tip
   translate([x_end+110, y_ctr-7/2,22.5-10]) cube([62,7,15]); 
    
   //finger holes 
   translate ([25,y_ctr,22.5-19]) rotate ([0,0,0]) cylinder(h=19, r=10);
   translate ([75,y_ctr,22.5-19]) rotate ([0,0,0]) cylinder(h=19, r=10);
   translate ([155,y_ctr,22.5-19]) rotate ([0,0,0]) cylinder(h=19, r=10);
    
   //spare tip 
   translate([x_end+65, 27.5-7/2, 22.5-10]) cube([105,7,15]); 
   translate([x_end+65+60, 27.5-11/2,22.5-15]) cube([10,11,15]); 

   //cable 
   translate([5, 34,22.5-20]) cube([width_x-10,35,20]); 

};

//indents to hold
   translate([x_end+45, y_ctr-10,22.5-15]) rotate([0,0,45]) cube([3,3,14]); 
   translate([x_end+45, y_ctr+6,22.5-15]) rotate([0,0,45]) cube([3,3,14]); 
   translate([x_end+100, y_ctr-12,22.5-15]) rotate([0,0,45]) cube([3,3,14]); 
   translate([x_end+100, y_ctr+8,22.5-15]) rotate([0,0,45]) cube([3,3,14]); 

   translate([x_end+100, 27.5-6.8,22.5-15]) rotate([0,0,45]) cube([3,3,14]); 
   translate([x_end+100, 27.5+2.2,22.5-15]) rotate([0,0,45]) cube([3,3,14]); 
   translate([x_end+160, 27.5-6.8,22.5-15]) rotate([0,0,45]) cube([3,3,14]); 
   translate([x_end+160, 27.5+2.2,22.5-15]) rotate([0,0,45]) cube([3,3,14]); 



module roundedcube(size = [1, 1, 1], center = false, radius = 0.5) {
	// If single value, convert to [x, y, z] vector
	size = (size[0] == undef) ? [size, size, size] : size;

	translate = (center == false) ?
		[radius, radius, radius] :
		[
			radius - (size[0] / 2),
			radius - (size[1] / 2),
			radius - (size[2] / 2)
	];

	translate(v = translate)
	minkowski() {
		cube(size = [
			size[0] - (radius * 2),
			size[1] - (radius * 2),
			size[2] - (radius * 2)
		]);
		sphere(r = radius);
	}
}