// Definitions
// **************************

btn_size=12;
btn_thick = 4;
hinge_thick = 0.4;
fix_block_thick =2;
num_buttons = 4;
gap=0.5;
hinge_depth=5;

//Definition of circle angular resolution
$fn = 128;  

difference() {
    for (i=[0:1:num_buttons-1]) {
    translate ([-(btn_size*num_buttons/2)+btn_size/2+i*btn_size,0,0]) cube([btn_size-gap/2,btn_size-gap/2,btn_thick], center=true);
    }



}
     
    translate ([0,btn_size/2+hinge_depth/2-gap/2,-btn_thick/2+hinge_thick/2
]) cube([btn_size*num_buttons-gap,hinge_depth,hinge_thick], center=true); //hinge


difference() {

    translate ([0,btn_size/2+hinge_depth/2-gap/2+0.5,-btn_thick/2+hinge_thick/2+fix_block_thick/2
]) cube([btn_size*num_buttons-gap,hinge_depth-1,hinge_thick+fix_block_thick], center=true); //hinge block


}



 