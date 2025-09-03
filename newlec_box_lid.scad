

w = 88;
h = 88;
d = 15;
sh=8; //screw head
wall=3;
sct=75; //screw centres
sd=4; //screw dia
cd=12; //corner dia

//Definition of circle angular resolution
res        = 50;   


difference () {

 union(){  
   difference(){
   roundcornerplate(w,h,d,cd);
   translate([0,0,wall]) roundcornerplate(w-2*wall,h-2*wall,d-2*wall,cd-wall);
   }
   translate([sct/2,0,0]) rotate([0,0,0]) cylinder(h=d,r=wall+sh/2-0.5,center=true,$fn=res);
   translate([-sct/2,0,0]) rotate([0,0,0]) cylinder(h=d,r=wall+sh/2-0.5,center=true,$fn=res);
 }

  //screw holes
   translate([sct/2,0,0]) rotate([0,0,0]) cylinder(h=d+2,r=sd/2,center=true,$fn=res);
   translate([-sct/2,0,0]) rotate([0,0,0]) cylinder(h=d+2,r=sd/2,center=true,$fn=res);

  //screw heads
   translate([sct/2,0,-d/2]) rotate([0,0,0]) cylinder(h=d/2,r=sh/2+0.5,center=true,$fn=res);
   translate([-sct/2,0,-d/2]) rotate([0,0,0]) cylinder(h=d/2,r=sh/2+0.5,center=true,$fn=res);


}

module roundcornerplate (wi,ht,de,rad) {
   union () {

     difference(){
       cube([wi,ht,d],center=true);
       translate([wi/2,ht/2,0]) cube([rad,rad,d+2],center=true);  //remove corners
       translate([wi/2,-ht/2,0]) cube([rad,rad,d+2],center=true);  
       translate([-wi/2,ht/2,0]) cube([rad,rad,d+2],center=true);  
       translate([-wi/2,-ht/2,0]) cube([rad,rad,d+2],center=true);  
     };

     //replace corners with round
     translate([wi/2-rad/2,ht/2-rad/2,0]) rotate([0,0,0]) cylinder(h=d,r=rad/2,center=true,$fn=res);
     translate([wi/2-rad/2,-(ht/2-rad/2),0]) rotate([0,0,0]) cylinder(h=d,r=rad/2,center=true,$fn=res);
     translate([-(wi/2-rad/2),ht/2-rad/2,0]) rotate([0,0,0]) cylinder(h=d,r=rad/2,center=true,$fn=res);
     translate([-(wi/2-rad/2),-(ht/2-rad/2),0]) rotate([0,0,0]) cylinder(h=d,r=rad/2,center=true,$fn=res);
	}
    
}