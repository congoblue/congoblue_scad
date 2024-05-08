// Definition size of housing
// **************************

intdia      = 60;    
lensdia      = 30;     
height     = 19;
recess     = 2.4;
wall        = 2;
overlap = 50;

radius     = 1.2;            
act_x      = 2.4;
act_y      = 2.4;
act_z      = 4;

act_clip_w=1;

//Definition of circle angular resolution
resol        = 64;           // Identical to housing !!!

union (){
difference () {
    linear_extrude(50) polygon(points=[[0,0],[5.5,0],[6.25,5],[-0.75,5]]);
    
};


};