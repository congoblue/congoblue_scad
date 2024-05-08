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

            cylinder ( h=wall*2+height, r=wall+intdia/2, $fn = resol);
    
    for (i=[0:height/2+4]) {        
    translate ([0,0,1+i*2]) cylinder ( h=2, r=lensdia/2-2+((intdia/2-lensdia/2) * i/(height/2)), $fn = resol);
    }
    
    cylinder ( h=1, r=lensdia/2, $fn = resol);
    
    translate ([25,0,2]) cylinder( h=height+2, r=3.5, $fn = resol);
    translate ([-25,0,2]) cylinder( h=height+2, r=3.5, $fn = resol);

    translate ([25,0,0]) cylinder( h=2, r=1.75, $fn = resol);
    translate ([-25,0,0]) cylinder( h=2, r=1.75, $fn = resol);



   // Space for Breakouts, holes, ...


};

