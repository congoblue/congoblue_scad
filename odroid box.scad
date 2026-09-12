// meanwell LRS psu cover
// **************************

width      = 176;
height = 30;
depth = 241;
thick = 3;
$fn=50;


difference () {
  translate ([-5,-50,-thick]) cube([width,depth,thick /*height*/]);
  
  //cooling cutout under odroid
  translate ([10,10,-thick-0.5]) cube([105-20,96-20,thick+1]);  
    
  //odroid cable tie
  translate ([105,96/2,-thick-0.5]) cube([2.5,6,thick+1]);
    
  //psu cable tie
  translate ([width-12-47,108/2,-thick-0.5]) cube([2.5,6,thick+1]);

  //wifi cable tie
  translate ([38-2.5,96+92/2,-thick-0.5]) cube([2.5,6,thick+1]);
  translate ([38+36,96+92/2,-thick-0.5]) cube([2.5,6,thick+1]);

  //dc cable tie
  translate ([90,-6,-thick-0.5]) cube([6,2.5,thick+1]);
  translate ([90,-45,-thick-0.5]) cube([6,2.5,thick+1]);


}

//side
  translate ([-5,-50,0]) cube([thick,50+96,33]);

//side
  translate ([width-5-thick,-50,0]) cube([thick,50+108,33]);

//wifi support
  translate ([38,96+92/2-8,0]) cube([36,20,13]);

  translate ([38-1,96+92,0]) cube([36+2,thick,33]);
  translate ([38-thick-1,96+92-20+thick,0]) cube([thick,20,33]);
  translate ([38+37,96+92-20+thick,0]) cube([thick,20,33]);


//odroid
//color("red") cube([105,96,33]);
//translate ([38,96,13]) color("red") cube([36,92,9]);

//psu
//translate ([120,0,0]) color("green") cube([47,108,30]);
   

   

