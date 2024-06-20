// Definition size of housing
// **************************

       // Those settings have to be identical to the cover !!!
width_x      = 100;          // Width of the housing (outer dimension) 
depth_y      = 140;           // Debth of the housing (outer dimension)
wall         = 1.8;          // Wall thickness of the box
cornerradius = 4.0;          // Radius of the corners
                             //   This value also defines the posts for stability and
                             //   for the press-in nuts!

       // Those settings are more or less independent from the cover
height_z     = 50;           // Heigth of the lower part. Total height is this value plus
                             //   the height of the cover
plate        = 1.8;          // Thickness of the bottom plain

       //Definition size of press-in nuts
nutdiameter  = 4.0;          // Hole diameter for thermal press-in nut
nutlength    = 5.8;          // Depth of the nut hole


//Definition of circle angular resolution
resol        = 36;

ard_x = 0;
ard_y = -25.5;
pillarheight=25;
pillardia=5;
holedia=2;

     ledht=13;
     ledx=30.5;
     leddia=19;
     camy=52;
     camdia=15;
     irdia=7;
     irx=19;


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
      
    //rpi pillars  
      translate ( [ard_x-(49/2),ard_y+(39),-height_z/2+pillarheight/2+plate] ) {
         difference () {
             cylinder ( h = pillarheight, r = pillardia/2, center = true, $fn = resol );
             cylinder ( h = pillarheight, r = holedia/2, center = true, $fn = resol );
         };
     };      

      translate ( [ard_x+(49/2),ard_y+(39),-height_z/2+pillarheight/2+plate] ) {
         difference () {
             cylinder ( h = pillarheight, r = pillardia/2, center = true, $fn = resol );
             cylinder ( h = pillarheight, r = holedia/2, center = true, $fn = resol );
         };
     };      

      translate ( [ard_x-(49/2),ard_y-(58-39),-height_z/2+pillarheight/2+plate] ) {
         difference () {
             cylinder ( h = pillarheight, r = pillardia/2, center = true, $fn = resol );
             cylinder ( h = pillarheight, r = holedia/2, center = true, $fn = resol );
         };
     };      

      translate ( [ard_x+(49/2),ard_y-(58-39),-height_z/2+pillarheight/2+plate] ) {
         difference () {
             cylinder ( h = pillarheight, r = pillardia/2, center = true, $fn = resol );
             cylinder ( h = pillarheight, r = holedia/2, center = true, $fn = resol );
         };
     };      

    //temp rpi outline to test
    /*translate ( [ard_x,ard_y,-height_z/2+pillarheight+plate+1.6/2] ) {
       cube ( [56, 85, 1.6], center = true);
      };*/
      

      
      //sleeves for LEDs
     translate ( [ledx,camy,-height_z/2+ledht/2] ) 
             cylinder ( h = ledht, r = (leddia+2)/2, center = true, $fn = resol );
     translate ( [-ledx,camy,-height_z/2+ledht/2] ) 
             cylinder ( h = ledht, r = (leddia+2)/2, center = true, $fn = resol );
      //sens1
     translate ( [irx,camy+7,-height_z/2+ledht/2] ) 
             cylinder ( h = ledht, r = (irdia+2)/2, center = true, $fn = resol );
      //sens2
     translate ( [-irx,camy-7,-height_z/2+ledht/2] ) 
             cylinder ( h = ledht, r = (irdia+2)/2, center = true, $fn = resol );

      //camsens
     translate ( [12.5,camy-13.5,-height_z/2+ledht/2] ) 
             cylinder ( h = ledht, r = (irdia+2)/2, center = true, $fn = resol );

      
      //cam
     translate ( [0,camy,-height_z/2+ledht/2] ) 
             cylinder ( h = ledht, r = (camdia+2)/2, center = true, $fn = resol );
      
      
   };

// Space for the construction of holes, breakouts, ... 
   //rj45
   translate ( [-17.75, -depth_y/2, -height_z/2+pillarheight+plate+1.6+15/2 ] ) {
            cube ( [17, 10, 15], center = true);
         };

   //usb1
   translate ( [1, -depth_y/2, -height_z/2+pillarheight+plate+1.6+17/2 ] ) {
            cube ( [15, 10, 17], center = true);
         };

   //usb2
   translate ( [19, -depth_y/2, -height_z/2+pillarheight+plate+1.6+17/2 ] ) {
            cube ( [15, 10, 17], center = true);
         };
         
         //sleeves for LEDs
     translate ( [ledx,camy,-height_z/2+ledht/2] ) 
             cylinder ( h = ledht+5, r = (leddia)/2, center = true, $fn = resol );
     translate ( [-ledx,camy,-height_z/2+ledht/2] ) 
             cylinder ( h = ledht+5, r = (leddia)/2, center = true, $fn = resol );
      //cam
     translate ( [0,camy,-height_z/2+ledht/2] ) 
             cylinder ( h = ledht+5, r = (camdia)/2, center = true, $fn = resol );
   
     //sens1
     translate ( [irx,camy+7,-height_z/2+ledht/2] ) 
             cylinder ( h = ledht+5, r = (irdia)/2, center = true, $fn = resol );
     //sens2
     translate ( [-irx,camy-7,-height_z/2+ledht/2] ) 
             cylinder ( h = ledht+5, r = (irdia)/2, center = true, $fn = resol );

      //camsens
     translate ( [12.5,camy-13.5,-height_z/2+ledht/2] ) 
             cylinder ( h = ledht+5, r = (irdia)/2, center = true, $fn = resol );

   //erase for testing
   /*translate ( [0, -50, 0] ) {
            cube ( [200, depth_y+20,150], center = true);
         };

   translate ( [0, 143, 0] ) {
            cube ( [200, depth_y+20,150], center = true);
         };

   translate ( [0, 0, 70] ) {
            cube ( [200, depth_y+20,150], center = true);
         };*/



};
