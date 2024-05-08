// Definitions
// **************************


//Definition of circle angular resolution
$fn = 128;  

    translate([0,0,2.5]) cube([43,7,5], center=true);

    translate ([18.5,0,5]) cylinder (h=2,r=1.5);
    translate ([-18.5,0,5]) cylinder (h=2,r=1.5);

    translate ([18.5,0,-1.5]) cylinder (h=1.5,r=1.25);
    translate ([-18.5,0,-1.5]) cylinder (h=1.5,r=1.25);
     


 