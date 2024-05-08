// Definition size of housing
// **************************

intdia      = 60;    
lensdia      = 42;     
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

    cylinder ( h=3.2, r=wall+intdia/2, $fn = resol);
    
    cylinder ( h=3.2, r=50/2, $fn = resol);
    
    translate ([27,0,0]) cylinder( h=4, r=1.75, $fn = resol);
    translate ([-27,0,0]) cylinder( h=4, r=1.75, $fn = resol);



   // Space for Breakouts, holes, ...


};

