// batten end cap
// **************************

side      = 30;
sidethick = 5;
endthick = 10;
overlap=15;
boxht=20;
boxlen=90;
boxwall=3;
$fn=50;

difference () {
    union () {


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


}


   
//box
difference () {   

translate ([-boxht,-sidethick,-boxlen+overlap+endthick]) cube ([boxht,side+sidethick*2,boxlen]);

   //chamfer
    translate ([-side-boxht,-sidethick,overlap+endthick-3]) rotate([45,0,0]) cube([side*3,10,10]);

    
   //dc skt
    translate ([-15,2,overlap]) cube ([11,9,20]);

   //switch
    translate ([-8,15,overlap]) cube ([3.5,6,20]);

    


}
}

   //pcb 30x75
    translate ([-boxht-boxwall,0,-boxlen+overlap+endthick+boxwall]) cube ([boxht,30,boxlen-boxwall*2]);

    //cable thru hole
    translate ([-15,26,12]) rotate([0,90,0]) cylinder(h=20,r=4);


}

//lid

difference () {

    union () {
    translate ([0,40,overlap+endthick-3]) cube ([boxlen,side+sidethick*2,3]);

    translate ([boxwall,40+sidethick,overlap+endthick-6]) cube ([boxlen-boxwall*2,30,3]);

    }

    //lid rim 
    translate ([boxwall+3,40+sidethick+3,overlap+endthick-6]) cube ([boxlen-boxwall*2-6,30-6,3]);


    //chamfer
    translate ([0,40,overlap+endthick-3]) rotate([45,0,90]) cube([side*3,10,10]);


}

