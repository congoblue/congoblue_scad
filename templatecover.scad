// Definition size of housing
// **************************

       // Those settings have to be identical to the box !!!
width_x      = 120;          // Width of the cover (outer dimension) 
debth_y      = 80;           // Debth of the cover (outer dimension)
wall         = 1.8;          // Side wall thickness of the cover
flange       = 1.2;            // fitting flange
flangeheight = 2;            // fitting flange
cornerradius = 4.0;          // Radius of the corners
                             //   This value also defines the posts for stability and
                             //   for the screw holes!

       // Those settings are more or less independent from the cover
height_z     = 4.5;          // Heigth of the cover. Total height is this value plus
                             //   the height of the box
plate        = 1.8;          // Thickness of top plate. Consider this value for the
                             //   elements which need to be mounted as well as for 
                             //   mechanical stability

       //Definition size of screws (Example value for M3 inner hex screw)
screwholediameter  = 3.2;    // Size of screw hole
screwheaddiameter  = 5.7;    // Size for screw head (diameter)
screwheadheigth    = 0;    // Heigth of the screw head
                             //   Screw head sits on top of cover if this value is set to zero
                             //   Consider material under screw head for mechanical strength 
                             //   when plunging screw 

//Definition of circle angular resolution
resol        = 36;           // Identical to housing !!!

pillarheight=6.5;
pillardia=5;
holedia=2.5;

difference () {

   // Construction Main Cover
   union () {
      difference () {
         // Construction of cover plate
         union () {
         translate ( [0,0, -plate / 2] ){ 
            cube ( [width_x, debth_y - (2* cornerradius), height_z-flangeheight], center = true );
            cube ( [width_x - (2* cornerradius), debth_y, height_z-flangeheight], center = true );
         };
         //flanges
            cube ( [width_x - wall*2, debth_y - (2* cornerradius), height_z], center = true );
            cube ( [width_x - (2* cornerradius) , debth_y - wall*2, height_z], center = true );
         };

         // Remove inner material
         translate ( [0,0, plate / 2+1] ){
            cube ( [width_x - (2* wall) - (2* flange), debth_y- (2* wall)- (2* flange), height_z - plate+1], center = true );
         };
         // Remove Screw hole in the 1st quadrant (required if screw head is thinner than plate!)
         translate ( [(width_x / 2) - cornerradius, (debth_y / 2) - cornerradius, 0 ] ) {
            cylinder ( h = height_z, r = screwheaddiameter / 2, center = true, $fn = resol );
         };
         // Remove Screw hole in the 2nd quadrant (required if screw head is thinner than plate!)
         translate ( [-(width_x / 2) + cornerradius, (debth_y / 2) - cornerradius, 0 ] ) {
            cylinder ( h = height_z, r = screwheaddiameter / 2, center = true, $fn = resol );
         };
         // Remove Screw hole in the 4th quadrant (required if screw head is thinner than plate!)
         translate ( [(width_x / 2) - cornerradius, -(debth_y / 2) + cornerradius, 0 ] ) {
            cylinder ( h = height_z, r = screwheaddiameter / 2, center = true, $fn = resol );
         };
         // Remove Screw hole in the 3rd quadrant (required if screw head is thinner than plate!)
         translate ( [-(width_x / 2) + cornerradius, -(debth_y / 2) + cornerradius, 0 ] ) {
            cylinder ( h = height_z, r = screwheaddiameter / 2, center = true, $fn = resol );
         };
      };

      // Construction of corner posts, screw holes and screw head holes
      //   in 1st quadrant
      translate ( [(width_x / 2) - cornerradius, (debth_y / 2) - cornerradius, -flangeheight/2 ] ) {
         difference () {
            cylinder (h=height_z-flangeheight, r=cornerradius, center = true, $fn = resol);
            cylinder (h = height_z, r = screwholediameter / 2, center = true, $fn = resol);
            translate ( [ 0, 0, - ( height_z / 2 ) + ( screwheadheigth / 2 ) ] ) {
               cylinder ( h = screwheadheigth, r = screwheaddiameter / 2, center = true, $fn = resol );
            };
            translate ( [ 0, 0, flangeheight*3 - plate*2 ] ) {
               cylinder ( h = flangeheight, r = cornerradius+1, center = true, $fn = resol );
            };
         };
      };
      //   in 2nd quadrant
      translate ( [-(width_x / 2) + cornerradius, (debth_y / 2) - cornerradius, -flangeheight/2] ) {
         difference () {
            cylinder (h=height_z-flangeheight, r=cornerradius, center = true, $fn = resol);
            cylinder (h = height_z, r = screwholediameter / 2, center = true, $fn = resol);
            translate ( [ 0, 0, - ( height_z / 2 ) + ( screwheadheigth / 2 ) ] ) {
               cylinder ( h = screwheadheigth, r = screwheaddiameter / 2, center = true, $fn = resol );
            };
            translate ( [ 0, 0, flangeheight*3 - plate*2 ] ) {
               cylinder ( h = flangeheight, r = cornerradius+1, center = true, $fn = resol );
            };
            
         };
      };
      //   in 4th quadrant
      translate ( [(width_x / 2) - cornerradius, -(debth_y / 2) + cornerradius, -flangeheight/2] ) {
         difference () {
            cylinder (h=height_z-flangeheight, r=cornerradius, center = true, $fn = resol);
            cylinder (h = height_z, r = screwholediameter / 2, center = true, $fn = resol);
            translate ( [ 0, 0, - ( height_z / 2 ) + ( screwheadheigth / 2 ) ] ) {
               cylinder ( h = screwheadheigth, r = screwheaddiameter / 2, center = true, $fn = resol );
            };
            translate ( [ 0, 0, flangeheight*3 - plate*2 ] ) {
               cylinder ( h = flangeheight, r = cornerradius+1, center = true, $fn = resol );
            };

         };
      };
      //   in 3rd quadrant
      translate ( [-(width_x / 2) + cornerradius, -(debth_y / 2) + cornerradius, -flangeheight/2] ) {
         difference () {
            cylinder (h=height_z-flangeheight, r=cornerradius, center = true, $fn = resol);
            cylinder (h = height_z, r = screwholediameter / 2, center = true, $fn = resol);
            translate ( [ 0, 0, - ( height_z / 2 ) + ( screwheadheigth / 2 ) ] ) {
               cylinder ( h = screwheadheigth, r = screwheaddiameter / 2, center = true, $fn = resol );
            };
            translate ( [ 0, 0, flangeheight*3 - plate*2 ] ) {
               cylinder ( h = flangeheight, r = cornerradius+1, center = true, $fn = resol );
            };

         };
      };
      
      //pcb mounts

      
      translate ( [-3,30,pillarheight/2] ) {
         difference () {
             cylinder ( h = pillarheight, r = pillardia/2, center = true, $fn = resol );
             cylinder ( h = pillarheight, r = holedia/2, center = true, $fn = resol );
         };
     };

      translate ( [-48,30,pillarheight/2] ) {
         difference () {
             cylinder ( h = pillarheight, r = pillardia/2, center = true, $fn = resol );
             cylinder ( h = pillarheight, r = holedia/2, center = true, $fn = resol );
         };
     };      
      
    translate ( [-3,-30,pillarheight/2] ) {
         difference () {
             cylinder ( h = pillarheight, r = pillardia/2, center = true, $fn = resol );
             cylinder ( h = pillarheight, r = holedia/2, center = true, $fn = resol );
         };
     };

      translate ( [-48,-30,pillarheight/2] ) {
         difference () {
             cylinder ( h = pillarheight, r = pillardia/2, center = true, $fn = resol );
             cylinder ( h = pillarheight, r = holedia/2, center = true, $fn = resol );
         };
     };           

      translate ( [-48,0,pillarheight/2] ) {
         difference () {
             cylinder ( h = pillarheight, r = pillardia/2, center = true, $fn = resol );
             cylinder ( h = pillarheight, r = holedia/2, center = true, $fn = resol );
         };
     };           

      translate ( [-3,0,pillarheight/2] ) {
         difference () {
             cylinder ( h = pillarheight, r = pillardia/2, center = true, $fn = resol );
             cylinder ( h = pillarheight, r = holedia/2, center = true, $fn = resol );
         };
     };           

     
   };

   // Space for Breakouts, holes, ...
   //joystick hole
    translate ( [32, 0, 0 ] ) {
            cylinder ( h = height_z+20, r = 40 / 2, center = true, $fn = resol );
         };

   //joystick screwholes
    translate ( [32-(32.5/2), 0-(32.5/2), 0 ] ) {
            cylinder ( h = height_z+20, r = 2 / 2, center = true, $fn = resol );
         };
    translate ( [32+(32.5/2), 0-(32.5/2), 0 ] ) {
            cylinder ( h = height_z+20, r = 2 / 2, center = true, $fn = resol );
         };
    translate ( [32-(32.5/2), 0+(32.5/2), 0 ] ) {
            cylinder ( h = height_z+20, r = 2 / 2, center = true, $fn = resol );
         };
    translate ( [32+(32.5/2), 0+(32.5/2), 0 ] ) {
            cylinder ( h = height_z+20, r = 2 / 2, center = true, $fn = resol );
         };
         
   //hole for buttons
    /*translate ( [-28, 0, 0 ] ) {
            cube ( [14*4, 14*4, 10], center = true);
         };*/
    translate ( [-5, -10, 0 ] ) {
            cube ( [11, 11, 10], center = true);
         };
    translate ( [-5, 10, 0 ] ) {
            cube ( [11, 11, 10], center = true);
         };

    translate ( [-20, 14.5, 0 ] ) {
            cube ( [11, 12, 10], center = true);
         };
    translate ( [-17, 25, 0 ] ) {
            cube ( [17, 11, 10], center = true);
         };

    translate ( [-20, -14.5, 0 ] ) {
            cube ( [11, 12, 10], center = true);
         };
    translate ( [-17, -25, 0 ] ) {
            cube ( [17, 11, 10], center = true);
         };


    translate ( [-40, -15, 0 ] ) {
            cube ( [21.5, 21.5, 10], center = true);
         };
    translate ( [-40, 15, 0 ] ) {
            cube ( [21.5, 21.5, 10], center = true);
         };
         


    //temp remove bits
    /*translate ( [-120, 0, 0 ] ) {
            cube ( [200, 200, 30], center = true);
         };
    translate ( [105, 0, 0 ] ) {
            cube ( [200, 200, 30], center = true);
         };*/
         
         


};

 //1-2 switches

    
    
    btn(-5,10,10,10,1,1,"2");
    btn(-5,-10,10,10,1,1,"1");

    btn(-20,14,10,10,1,1,"f",0,1);
    btn(-20,-14,10,10,1,1,"f",0,1);

    btn(-13,25,7.5,10,0,0,"+",1,-1);
    btn(-21.25,25,7.5,10,0,1,"_",4,0);

    btn(-13,-25,7.5,10,0,0,"+",1,-1);
    btn(-21.25,-25,7.5,10,0,1,"_",4,0);


    btn(-34.75,-9.75,10,10,0,0,"2");
    btn(-34.75,-20.25,10,10,0,0,"1");
    btn(-45.25,-9.75,10,10,0,1,"4");
    btn(-45.25,-20.25,10,10,0,1,"3");

    btn(-34.75,9.75,10,10,0,0,"1");
    btn(-34.75,20.25,10,10,0,0,"2");
    btn(-45.25,9.75,10,10,0,1,"3");
    btn(-45.25,20.25,10,10,0,1,"4");


     
module btn(bx,by,sx,sy,led, botsupport, legend,lofx=0,lofy=0) {
    difference() {
        btnthick=height_z-flangeheight;
        translate ( [bx, by, -plate/2 ] ) {
            cube ( [sx, sy, btnthick+0.2], center = true);
         };
        if (led==1) {
         translate ( [bx+3,by-3, -plate/2 -1] ){
            cylinder ( h=20, r=1.25, center = true, $fn=20 );
         };
     };
        translate ( [bx, by, -0.5 ] ) {
            cube ( [2.75, 2.75, 0.75], center = true);
         };
        translate ( [bx, by, 0 ] ) {
            cube ( [2.75, 2.75, 1], center = true);
         };

     };

   if (led==1) //window fill for LED
   {
                translate ( [bx+3,by-3, -plate/2 -1.2] ){ color("#00FF00")
            cylinder ( h=0.4, r=1.25, center = true, $fn=20 );
         };

   }
     
   btnhinge(bx+(sx/2)-0.5,by+4.4);
   btnhinge(bx+(sx/2)-0.5,by-4.4);
   if (botsupport==1)
   {
   btnhinge(bx-(sx/2+1),by+4.4);
   btnhinge(bx-(sx/2+1),by-4.4);
   }
  
   translate ( [bx-4+lofx,by-0.4+lofy,-2.26] ){ rotate([0,0,-90]) mirror([1,0,0])
        color("#FF0000") linear_extrude(height = 0.4) {
         text(legend, size=5, font="Swis721 Blk BT:style=Black" );
         };
     };
         
}

module btnhinge(px,py) {
   /*translate([px-0.25,py,0]) rotate([0,-30,0]) cube([0.6,1.4,2],center=true);
   translate([px+1.5,py,0.5]) rotate([0,30,0]) cube([0.6,1.4,1],center=true);*/
   /*translate([px-0.25,py,1]) cube([1,1,0.5],center=true);
   translate([px+1.75,py,1]) cube([1,1,0.5],center=true);*/

   /*translate([px-0.25,py,1.8]) rotate([0,20,0]) cube([0.6,1.4,2.5],center=true);
   translate([px+1.2,py,1.8]) rotate([0,-20,0]) cube([0.6,1.4,2.5],center=true);

   //translate([px+0.75,py,2]) cube([3,1,0.5],center=true);
    translate([px+0.55,py,2.8]) cube([1,1.4,0.6],center=true);*/
    
    difference(){
    translate([px+0.6,py,1.4]) rotate([90,0,0]) cylinder(h=1.4,r=2,center=true,$fn=resol);
    translate([px+0.6,py,1.4]) rotate([90,0,0]) cylinder(h=1.4,r=1.4,center=true,$fn=resol);
    translate([px+0.55,py,-0.8]) cube([5,2,2],center=true);
    }
    
}

module roundedcube(size = [1, 1, 1], center = false, radius = 0.5, apply_to = "all") {
	// If single value, convert to [x, y, z] vector
	size = (size[0] == undef) ? [size, size, size] : size;

	translate_min = radius;
	translate_xmax = size[0] - radius;
	translate_ymax = size[1] - radius;
	translate_zmax = size[2] - radius;

	diameter = radius * 2;

	obj_translate = (center == false) ?
		[0, 0, 0] : [
			-(size[0] / 2),
			-(size[1] / 2),
			-(size[2] / 2)
		];

	translate(v = obj_translate) {
		hull() {
			for (translate_x = [translate_min, translate_xmax]) {
				x_at = (translate_x == translate_min) ? "min" : "max";
				for (translate_y = [translate_min, translate_ymax]) {
					y_at = (translate_y == translate_min) ? "min" : "max";
					for (translate_z = [translate_min, translate_zmax]) {
						z_at = (translate_z == translate_min) ? "min" : "max";

						translate(v = [translate_x, translate_y, translate_z])
						if (
							(apply_to == "all") ||
							(apply_to == "xmin" && x_at == "min") || (apply_to == "xmax" && x_at == "max") ||
							(apply_to == "ymin" && y_at == "min") || (apply_to == "ymax" && y_at == "max") ||
							(apply_to == "zmin" && z_at == "min") || (apply_to == "zmax" && z_at == "max")
						) {
							sphere(r = radius);
						} else {
							rotate = 
								(apply_to == "xmin" || apply_to == "xmax" || apply_to == "x") ? [0, 90, 0] : (
								(apply_to == "ymin" || apply_to == "ymax" || apply_to == "y") ? [90, 90, 0] :
								[0, 0, 0]
							);
							rotate(a = rotate)
							cylinder(h = diameter, r = radius, center = true);
						}
					}
				}
			}
		}
	}
}