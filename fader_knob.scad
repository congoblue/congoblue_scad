width  = 12; // Knob width (extrude)
bottom = 10; //thick end height
top=6;
depth = 12; //height
tangx=5;
tangy=1;
tangz=10;


difference () {

translate ([0,width/2,0]) rotate ([90,0,0]) linear_extrude(width) polygon(points=[[bottom/2,0],[-bottom/2,0],[-top/2,depth],[top/2,depth]]);

  //for (i=[1:2:length]) translate ([i,-0.5,-5]) cube ([1,1,30]);
    
    translate ([-tangx/2,-tangy/2,0]) cube ([tangx,tangy,tangz]);

    translate ([-0.5,-width/2,depth-1]) cube ([1,width,1]);
    translate ([-0.5,-width/2,0]) cube ([1,1,depth]);
    translate ([-0.5,width/2-1,0]) cube ([1,1,depth]);
}
 
