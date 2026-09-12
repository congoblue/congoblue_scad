// Definition size of housing
// **************************

       // Those settings have to be identical to the cover !!!
width_x      = 100;          // Width of the housing (outer dimension) 
depth_y      = 90;           // depth of the housing (outer dimension)
wall         = 1.8;          // Wall thickness of the box
cornerradius = 4.0;          // Radius of the corners
                             //   This value also defines the posts for stability and
                             //   for the press-in nuts!

       // Those settings are more or less independent from the cover
height_z     = 25;           // Heigth of the lower part. Total height is this value plus
                             //   the height of the cover
plate        = 1.8;          // Thickness of the bottom plain

       //Definition size of press-in nuts
nutdiameter  = 4.2;          // Hole diameter for thermal press-in nut
nutlength    = 5.8;          // Depth of the nut hole


//Definition of circle angular resolution
resol        = 36;

ard_x = 47;
ard_y = 20;
pillarheight=4;
pillardia=5;
holedia=2;


difference () {

// Construction of housing
   union () {
   // Definition of main body
      difference () {
         union () {
            cube ( [width_x, depth_y - (2* cornerradius), height_z], center = true );
            cube ( [width_x - (2* cornerradius), depth_y, height_z], center = true );
         };
         translate ( [0,0, 0.5+plate / 2] ){
            cube ( [width_x - (2* wall), depth_y- (2* wall), height_z - plate +1], center = true ); 
         };
      };
      


      // Construction of four corner cylinders including nut holes
      // 1st quadrant
      translate ( [(width_x / 2) - cornerradius, (depth_y / 2) - cornerradius, 0 ] ) {
         difference () {
            cylinder (h=height_z, r=cornerradius, center = true, $fn = resol);
            translate ( [ 0,0,(height_z / 2)-(nutlength / 2) ] ) {
               cylinder (h = nutlength, r = nutdiameter / 2, center = true, $fn = resol);
            };
         };
      };

      // 2nd quadrant
      translate ( [-(width_x / 2) + cornerradius, (depth_y / 2) - cornerradius, 0] ) {
         difference () {
            cylinder (h=height_z, r=cornerradius, center = true, $fn = resol);
            translate ( [ 0,0,(height_z / 2)-(nutlength / 2) ] ) {
               cylinder (h = nutlength, r = nutdiameter / 2, center = true, $fn = resol);
            };
         };
      };

      // 4th quadrant
      translate ( [(width_x / 2) - cornerradius, -(depth_y / 2) + cornerradius, 0] ) {
         difference () {
            cylinder (h=height_z, r=cornerradius, center = true, $fn = resol);
            translate ( [ 0,0,(height_z / 2)-(nutlength / 2) ] ) {
               cylinder (h = nutlength, r = nutdiameter / 2, center = true, $fn = resol);
            };
         };
      };

      // 3rd quadrant
      translate ( [-(width_x / 2) + cornerradius, -(depth_y / 2) + cornerradius, 0] ) {
         difference () {
            cylinder (h=height_z, r=cornerradius, center = true, $fn = resol);
            translate ( [ 0,0,(height_z / 2)-(nutlength / 2) ] ) {
               cylinder (h = nutlength, r = nutdiameter / 2, center = true, $fn = resol);
            };
         };
      }; 
      
    //fad pillars  
    pillar(-30-10,-30,-6,10-plate,7);
    pillar(-30+10,-30,-6,10-plate,7);
    pillar(-30-10,30,-6,10-plate,7);
    pillar(-30+10,30,-6,10-plate,7);
      
    //button pillars
    pillar(30,-8,-4.8,12,7);
    pillar(0,-8,-4.8,12,7);
    pillar(30,38,-4.8,12,7);
    pillar(0,38,-4.8,12,7);
      /*
      translate ( [ard_x,ard_y,-height_z/2+pillarheight/2+plate] ) {
         difference () {
             cylinder ( h = pillarheight, r = pillardia/2, center = true, $fn = resol );
             cylinder ( h = pillarheight, r = holedia/2, center = true, $fn = resol );
         };
     };      

      translate ( [ard_x-15.2,ard_y-50.8,-height_z/2+pillarheight/2+plate] ) {
         difference () {
             cylinder ( h = pillarheight, r = pillardia/2, center = true, $fn = resol );
             cylinder ( h = pillarheight, r = holedia/2, center = true, $fn = resol );
         };
     };      

      translate ( [ard_x-(15.2+27.9),ard_y-50.8,-height_z/2+pillarheight/2+plate] ) {
         difference () {
             cylinder ( h = pillarheight, r = pillardia/2, center = true, $fn = resol );
             cylinder ( h = pillarheight, r = holedia/2, center = true, $fn = resol );
         };
     };      

      translate ( [ard_x-(15.2+27.9+4.7),ard_y+1.25,-height_z/2+pillarheight/2+plate] ) {
         difference () {
             cylinder ( h = pillarheight, r = pillardia/2, center = true, $fn = resol );
             cylinder ( h = pillarheight, r = holedia/2, center = true, $fn = resol );
         };
     }; */     

    //temp arduino outline to test
    /*  translate ( [ard_x+2.75-53/2,ard_y+15.2-68/2,-height_z/2+pillarheight+plate+1.6/2] ) {
       cube ( [53, 68, 1.6], center = true);
      };*/
   };

// Space for the construction of holes, breakouts, ... 
   //slider
   translate ([-30,0, -height_z/2] ) cube ([3,68,10], center=true);
   
   //switches
   translate ([15,15, -height_z/2] ) cube ([38,38,10], center=true);
   

   //cable
   translate ( [0, -depth_y/2, 11] ) {
            rotate ([90,0,0]) cylinder ( h = 15, r = 2, center = true, $fn = resol );
         };




};

module pillar(px,py,pz,ht,pdia)
{
      translate ( [px,py,pz] ) {
         difference () {
             cylinder ( h = ht, r = pdia/2, center = true, $fn = resol );
             cylinder ( h = ht, r = nutdiameter/2, center = true, $fn = resol );
         };
     };
};
