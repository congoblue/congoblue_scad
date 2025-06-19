// Definition size of housing
// **************************

width      = 10.25;    
depth      = 10.25;     
height     = 9;
recess     = 2.4;
rim        = 1;
legend  = "4";

radius     = 1.2;            
act_x      = 2.4;
act_y      = 2.4;
act_z      = 4;

act_clip_w=1;

sidepad = 0.8; //was 1.0
sidepad_w = 3.0; //was 3.5

//Definition of circle angular resolution
resol        = 36;           // Identical to housing !!!


difference () {

   // Construction Main Cover
   union () {
      difference () {
         // Cap
            roundedcube ( [width, depth, height*2],center = true, radius );

         // Remove back side
         union () {
          translate ( [0,0, -height/2] ){
            cube ( [width+1, depth+1, height], center = true );
         };
          translate ( [0,0, (height-rim)/2] ){
            cube ( [width-2*rim, depth-2*rim, (height-rim)], center = true );
         };
         
         //led hole     (COMMENT OUT for no led)
         /*
          translate ( [-3,3, (height-rim)/2 -3.7] ){
            cylinder ( h=20, r=1.25, center = true, $fn=20 );
         };

          translate ( [-4,4, (height-rim)/2 -9] ){
            cylinder ( h=20, r=2, center = true, $fn=20 );
         };
         */

         
     };
     };
      
    //clips for top of switch
    translate ( [act_x/2+act_clip_w/2,0, (height-rim)-act_z/2] ){
            cube ( [act_clip_w, act_y-0.2, act_z], center = true );
         };

    translate ( [0,act_y/2+act_clip_w/2, (height-rim)-act_z/2] ){
            cube ( [act_x-0.2, act_clip_w, act_z], center = true );
         };

    translate ( [-(act_x/2+act_clip_w/2),0, (height-rim) -act_z/2] ){
            cube ( [act_clip_w, act_y-0.2, act_z], center = true );
         };

    translate ( [0,-(act_y/2+act_clip_w/2),(height-rim) -act_z/2] ){
            cube ( [act_x-0.2, act_clip_w, act_z], center = true );
         };
         
    //pads to stop twisting         
    translate ( [0,width/2-rim-sidepad/2, (height-rim)/2] ){
            cube ( [sidepad_w, sidepad, height-rim], center = true );
         };
    translate ( [0,-(width/2-rim-sidepad/2), (height-rim)/2] ){
            cube ( [sidepad_w, sidepad, height-rim], center = true );
         };


    translate ( [0,-depth/3,height-0.5] ){
        color("#FF0000") linear_extrude(height = 0.4) {
         text(legend, size=5, font="Swis721 Blk BT:style=Black" );
         };
     };

    /*translate ( [-1.3,2,height-0.3] ){
        color("#FF0000") cube ( [5.5,3, 0.4], center = true );
     };*/

     
   };

   // Space for Breakouts, holes, ...


};

module roundedcube(size = [1, 1, 1], center = false, radius = 0.75, apply_to = "all") {
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