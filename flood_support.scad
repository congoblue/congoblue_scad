// batten end cap
// **************************

side = 250;
height=120;
thick = 9.5;
pillar=10;
//floodrad=7.5;
//ypos=85;
//xpos=20;
$fn=50;


difference () {
    union () {
        
        cube([side,height,thick]);

        //translate ([0,20,0]) cube([40,10,10.25]);

        //translate ([0,40,0]) cube([40,10,10]);

 //top
 /*      difference () {
       
       translate ([0,0,0]) cylinder(h=overlap+endthick,r=side+sidethick);
       translate ([0,0,0]) cylinder(h=overlap,r=side);
       }
 
 //sides
       
       union () {
       translate ([-sidethick,-sidethick,0]) cube([side+sidethick,sidethick,overlap+endthick]);
       translate ([-sidethick,0,0]) cube([sidethick,side,overlap+endthick]);
       }

*/
 
   }
   
   /*
   translate ([-(side+sidethick*2),-sidethick-side,0]) cube([side+sidethick,side*2+sidethick*2,overlap+endthick+5]);

   translate ([-(side+sidethick),-sidethick*2-side,0]) cube([side*2+sidethick*2,side+sidethick,overlap+endthick+5]);

   translate ([-side,-sidethick,overlap+endthick-3]) rotate([45,0,0]) cube([side*3,10,10]);

   translate ([-sidethick,-sidethick,overlap+endthick-3]) rotate([45,0,90]) cube([side*3,10,10]);
*/
/*
   translate([xpos,ypos-10,0])
   {
   rotate ([0,0,7.5])
   {
   translate ([0,0,0]) cube([floodflat,floodrad*2,thick+5]);
   translate ([0,0+floodrad,0]) cylinder(h=thick+5,r=floodrad);
   translate ([0+floodflat,0+floodrad,0]) cylinder(h=thick+5,r=floodrad);
   }
   }
*/

    translate ([pillar,pillar,-5]) cube([side-pillar*2,height-pillar*2,thick+10]);

}

    translate ([side/2-pillar/2,0,0]) cube([pillar,height,thick]);

    translate ([side/2-pillar/2,0,0]) rotate([0,0,48]) cube([pillar,height*1.3,thick]);
    translate ([side/2+pillar/8,pillar,0]) rotate([0,0,-48]) cube([pillar,height*1.3,thick]);
   
   

   

