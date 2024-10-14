// Definition of dog foot size
// **************************

pad_dia      = 60;          // foot pad dia
foot_len = 170;   //length of foot to elbow inc pad
foot_wid = 50;    //width of leg
foot_ht = 40;  //height of leg (same as pad)
sole = 4;
sides =2;
hole=8;
fill=2;
tongue=5;

difference () {

   // foot pad under
   union () {
        cylinder(h=sole,r=pad_dia/2);
        translate([foot_len-pad_dia/2-foot_wid/2,0,0]) cylinder(h=sole,r=foot_wid/2);
        translate([0,-foot_wid/2,0]) cube([foot_len-pad_dia/2-foot_wid/2,foot_wid,sole]);

   //around the foot pad
   difference () {
       //cylinder(h=sole+foot_ht+sides, r=pad_dia/2);
       //translate ([0,0,sole]) cylinder(h=foot_ht+sides, r=pad_dia/2-sides);
       hull () {
               translate ([0,0,sole]) sphere (pad_dia/2);
               translate([foot_len-pad_dia/2-foot_wid/2,0,0]) cylinder(h=sole+foot_ht,r=foot_wid/2);
       }
       
       hull () {
               translate ([0,0,sole]) sphere (pad_dia/2-sides);
               translate([foot_len-pad_dia/2-foot_wid/2,0,0]) cylinder(h=sole+foot_ht-sides,r=foot_wid/2-sides);
       }
   };
   
   //long sides
   


   };
   
   
   //grooves for bending
   translate([pad_dia/2-12,-foot_wid/2-15,0]) cube([2,foot_wid+30,2]);
   translate([pad_dia/2-8,-foot_wid/2-15,0]) cube([2,foot_wid+30,2]);
   translate([pad_dia/2-16,-foot_wid/2-15,0]) cube([2,foot_wid+30,2]);
   
   //leggy hole
   translate([foot_len-pad_dia/2-foot_wid/2,0,sole]) cylinder(h=sole+foot_ht-sides,r=foot_wid/2-sides);
   
   //holes in the sides
   for (i=[0:hole+fill:foot_len]) {
   translate ([i,-foot_wid,sole]) cube([hole,foot_wid*2,hole]);
   translate ([i,-foot_wid,sole+hole+fill]) cube([hole,foot_wid*2,hole]);
   }
   
   //zip
   translate([hole*2+fill*2,-1,foot_ht/2]) cube([foot_len/2,2,30]);

   //holes in the top
   for (i=[hole*2+fill*2:hole+fill:foot_len-foot_wid*2]) {
   translate ([i,-hole-fill/2-2,sole]) cube([hole,hole,foot_ht*2]);
   translate ([i,fill/2+2,sole]) cube([hole,hole,foot_ht*2]);
   }
   //3,4 from the front
   for (i=[hole+fill:hole+fill:hole*1+fill*1]) {
   translate ([i,-hole-fill/2,sole]) cube([hole,hole,foot_ht*2]);
   translate ([i,fill/2,sole]) cube([hole,hole,foot_ht*2]);
   }
   //the 2 at the front
   translate ([0,-hole-fill/2,sole]) cube([hole,hole,foot_ht*2]);
   translate ([0,fill/2,sole]) cube([hole,hole,foot_ht*2]);
   //gap for bending
   translate ([hole+fill,-hole*3-fill,sole]) cube([hole,hole*3,foot_ht*2]);
   translate ([hole+fill,fill/2,sole]) cube([hole,hole*3,foot_ht*2]);
   
   //holes round the front
   translate ([-pad_dia/2,fill/2,sole]) cube([10,hole,hole]);
   translate ([-pad_dia/2,-hole-fill/2,sole]) cube([10,hole,hole]);
   translate ([-pad_dia/2,fill/2,sole+hole+fill]) cube([15,hole,hole]);
   translate ([-pad_dia/2,-hole-fill/2,sole+hole+fill]) cube([15,hole,hole]);
   translate ([-pad_dia/2,hole+fill+fill/2,sole]) cube([15,hole,hole]);
   translate ([-pad_dia/2,-hole*2-fill-fill/2,sole]) cube([15,hole,hole]);
 

   //cut off under the sole
   translate ([-foot_len,-foot_wid,-foot_ht]) cube ([foot_len*2, foot_wid*2,foot_ht]);
   
   //diagnostic slicer
   //translate([0,0,0]) cube([200,200,200]);

};

//tongue part
difference () {
   translate([foot_len-pad_dia/2-foot_wid/2,0,sole+foot_ht]) cylinder(h=tongue,r=foot_wid/2);
   translate([foot_len-pad_dia/2-foot_wid/2,0,sole+foot_ht]) cylinder(h=tongue+2,r=foot_wid/2-sides);
   //zip
   translate([hole*2+fill*2,-1,foot_ht/2]) cube([foot_len/2,2,30]);

}
       // translate([-pad_dia/2,40,0]) cube([foot_len,foot_wid,sole]);

//fastener
translate ([0,30,0]) cube ([hole*2+fill*4,hole+fill*2,2]);
translate ([fill,30+fill,2]) cube ([hole,hole,2]);
translate ([fill+hole+2+fill,30+fill,2]) cube ([hole,hole,2]);

module pcbpillar(xp,yp,ht) {
    pillar(xp,yp,ht,pillardia,holedia);    
};

