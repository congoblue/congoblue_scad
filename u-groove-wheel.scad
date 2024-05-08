// Definitions
// **************************

outerdia = 60;
thick = 22;
groovedia = 20;
groovecentre = 66;

//608RS bearing
bearingdia = 22;
bearingthick = 7;

//Definition of circle angular resolution
$fn = 128;  


union () {
 difference () {
 
     // main block
   translate ([0,0,0]) cylinder (h=thick,r=outerdia/2);


       
   //remove bearing
     //clearance for bearing press fit, don't go all the way through
     //so we have a stop to push the bearing against
   translate ([0,0,thick/2-bearingthick/2]) cylinder (h=thick+2,r=bearingdia/2);
   translate ([0,0,-1]) cylinder (h=thick+2,r=bearingdia/2-2);
   
   
   //remove groove
   rotate_extrude($fn=256, convexity = 10)
   translate([groovecentre/2, thick/2, 0])
   circle(r = groovedia/2);

     
   

         
 };      
};
