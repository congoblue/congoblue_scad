// batten end cap
// **************************

side      = 30;
sidethick = 5;
endthick = 10;
overlap=15;
$fn=50;


difference () {
    union () {
 //top
       difference () {
       
       translate ([0,0,0]) cylinder(h=overlap+endthick,r=side+sidethick);
       translate ([0,0,0]) cylinder(h=overlap,r=side);
       }
 
 //sides
       
       union () {
       translate ([-sidethick,-sidethick,0]) cube([side+sidethick,sidethick,overlap+endthick]);
       translate ([-sidethick,0,0]) cube([sidethick,side,overlap+endthick]);
       }


 
   }
   
   translate ([-(side+sidethick*2),-sidethick-side,0]) cube([side+sidethick,side*2+sidethick*2,overlap+endthick+5]);

   translate ([-(side+sidethick),-sidethick*2-side,0]) cube([side*2+sidethick*2,side+sidethick,overlap+endthick+5]);

   translate ([-side,-sidethick,overlap+endthick-3]) rotate([45,0,0]) cube([side*3,10,10]);

   translate ([-sidethick,-sidethick,overlap+endthick-3]) rotate([45,0,90]) cube([side*3,10,10]);


}
   
   

   

