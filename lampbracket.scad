// Definition size of housing
// **************************

intdia      = 60;    
lensdia      = 30;     
height     = 19;
recess     = 2.4;
wall        = 2;
overlap = 10;

radius     = 1.2;            
act_x      = 2.4;
act_y      = 2.4;
act_z      = 4;

act_clip_w=1;

//Definition of circle angular resolution
resol        = 64;           // Identical to housing !!!


difference () {

    union () {
    translate ([-39,0,0]) cube([78,15,4]);        
    translate ([35,0,0]) cube([4,15,60]);
    translate ([-39,0,0]) cube([4,15,60]);
    translate ([35,7.5,60]) rotate ([0,90,0]) cylinder( h=4, r=7.5, $fn = resol);
    translate ([-39,7.5,60]) rotate ([0,90,0]) cylinder( h=4, r=7.5, $fn = resol);

    };
    
    translate ([0,7.5,0]) cylinder( h=5, r=3, $fn = resol);
    translate ([35,7.5,60]) rotate ([0,90,0]) cylinder( h=height+2, r=1.75, $fn = resol);
    translate ([-35,7.5,60]) rotate ([0,270,0]) cylinder( h=height+2, r=1.75, $fn = resol);




   // Space for Breakouts, holes, ...


};

