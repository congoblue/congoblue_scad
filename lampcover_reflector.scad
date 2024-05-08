// Definition size of housing
// **************************

intdia      = 60;    
lensdia      = 42;     
height     = 15;
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

    cylinder ( h=wall*2+height, r=wall+intdia/2, $fn = resol);
    
    //cutout for reflector face
    cylinder ( h=10, r=45/2, $fn = resol);

    //cutout for main end
    translate ([0,0,4]) cylinder ( h=20, r=intdia/2, $fn = resol);
    
    translate ([27,0,2]) cylinder( h=height+2, r=3.5, $fn = resol);
    translate ([-27,0,2]) cylinder( h=height+2, r=3.5, $fn = resol);

    translate ([27,0,0]) cylinder( h=2, r=1.75, $fn = resol);
    translate ([-27,0,0]) cylinder( h=2, r=1.75, $fn = resol);



   // Space for Breakouts, holes, ...


};

