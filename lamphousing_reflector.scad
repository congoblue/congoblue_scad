// Definition size of housing
// **************************

intdia      = 60;    
lensdia      = 30;     
height     = 2+20.7-1.6;
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
    union(){
            cylinder ( h=wall+height+overlap, r=wall+intdia/2, $fn = resol); //main body
            translate ([0,5+intdia/2,overlap*2/3]) rotate([90,0,0]) cylinder( h=4, r=5, 
$fn = resol); //yoke bracket standoff
            translate ([0,-1-intdia/2,overlap*2/3]) rotate([90,0,0]) cylinder( h=4, r=5, $fn = resol); //yoke bracket standoff
    };
            translate ([0,0,-wall]) cylinder ( h=height+overlap+wall, r=intdia/2, $fn = resol); //main body cavity
            cylinder ( h=height+wall+overlap, r=39/2, $fn = resol); //reflector cutout

    //screw holes
    translate ([0,27,(wall+height+overlap)-2]) cylinder( h=6, r=1.25, $fn = resol); 
    translate ([0,-27,(wall+height+overlap)-2]) cylinder( h=6, r=1.25, $fn = resol);
    
    
    //heatsink vane cutouts
    translate ([intdia/4,intdia/4,(overlap-10)/2]) rotate ([0,0,45]) cube ([lensdia, lensdia, overlap-10], center=true);

    translate ([-intdia/4,intdia/4,(overlap-10)/2]) rotate ([0,0,45]) cube ([lensdia, lensdia, overlap-10], center=true);

    translate ([intdia/4,-intdia/4,(overlap-10)/2]) rotate ([0,0,45]) cube ([lensdia, lensdia, overlap-10], center=true);

    translate ([-intdia/4,-intdia/4,(overlap-10)/2]) rotate ([0,0,45]) cube ([lensdia, lensdia, overlap-10], center=true);
    

   // Yoke bracket holes
    translate ([0,5+intdia/2,overlap*2/3]) rotate([90,0,0]) cylinder( h=8, r=2, $fn = resol);
    translate ([0,3-intdia/2,overlap*2/3]) rotate([90,0,0]) cylinder( h=8, r=2, $fn = resol);

};

//standoffs for positioning on heatsink
translate ([26.5,-2.5,overlap]) cube ([5,5,height]);
translate ([-31.5,-2.5,overlap]) cube ([5,5,height]);
translate ([-2.5,26.5,overlap]) cube ([5,5,height]);
translate ([-2.5,-31.5,overlap]) cube ([5,5,height]);



};