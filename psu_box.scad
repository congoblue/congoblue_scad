// meanwell LRS psu cover
// **************************

width      = 97;
height = 30;
depth = 120;
thick = 3;
$fn=50;


difference () {
  translate ([0,0,(depth+thick*2)/2]) cube([width+thick*2,height+thick*2,depth+thick*2], center=true);
  translate ([0,0,depth/2+thick]) cube([width,height,depth], center=true);

 
  for (i=[15:5:80] ){
      translate ([0,height/2-5,i]) cube([20,20,3], center=true);
      translate ([25,height/2-5,i]) cube([20,20,3], center=true);
      translate ([-25,height/2-5,i]) cube([20,20,3], center=true);
      translate ([-width/2,-height/2+6,i]) cube([20,10,3], center=true);
  }
   
  translate ([-40,-10,depth]) cylinder(h=20, r=3.5);
  translate ([40,-10,depth]) cylinder(h=20, r=2);
  translate ([32,-10,depth]) cylinder(h=20, r=2);
  
   /*
   translate ([-(side+sidethick*2),-sidethick-side,0]) cube([side+sidethick,side*2+sidethick*2,overlap+endthick+5]);

   translate ([-(side+sidethick),-sidethick*2-side,0]) cube([side*2+sidethick*2,side+sidethick,overlap+endthick+5]);

   translate ([-side,-sidethick,overlap+endthick-3]) rotate([45,0,0]) cube([side*3,10,10]);

   translate ([-sidethick,-sidethick,overlap+endthick-3]) rotate([45,0,90]) cube([side*3,10,10]);
*/

    //half cut off
  //top
   translate ([0,height/2,(depth+10)/2]) cube([width+10,height,depth+10], center=true);
  
   translate ([width/2+1.5,0,depth/2+3]) cube([1,2,depth+4], center=true);
   translate ([-(width/2+1.5),0,depth/2+3]) cube([1,2,depth+4], center=true);
   translate ([0,0,depth+4.5]) cube([width+3,2,1], center=true);
   translate ([0,0,1.5]) cube([width+3,2,1], center=true);
  
  //bottom
    //translate ([0,-height/2,(depth+10)/2]) cube([width+10,height,depth+10], center=true);

}
   
   //bottom rim
   /*translate ([width/2+1.5,0,depth/2+3]) cube([1,2,depth+4], center=true);
   translate ([-(width/2+1.5),0,depth/2+3]) cube([1,2,depth+4], center=true);
   translate ([0,0,depth+4.5]) cube([width+3,2,1], center=true);
   translate ([0,0,1.5]) cube([width+3,2,1], center=true);*/

   

