// Definition size of housing
// **************************

length =140;
width      = 75;    
height      = 10;     
studheight    = 10;

cutoutlength = 110;
cutoutwidth = 52;

flangewidth = 22;
flangeheight = 4;



//Definition of circle angular resolution
resol        = 64;           // Identical to housing !!!



difference () {
    
    union() {

        translate ([0,0,0]) cylinder (h=2, r=11.25, $fn=resol);
        translate ([0,0,4.5]) cube([31,26,6], center=true); //back
    }

    translate ([7,7,7]) cube([31,26,8], center=true); //back
    translate ([-7,-7,7]) cube([31,26,8], center=true); //back
    //translate ([length-20,width/2,-1]) cylinder (h=8+2, r=2.5, $fn=resol);
    translate ([0,0,0]) cylinder (h=2, r=3.1, $fn=resol);
    translate ([12,-9.5,0]) cylinder (h=8, r=2, $fn=resol);
    translate ([-12,9.5,0]) cylinder (h=8, r=2, $fn=resol);
    
    translate ([0,0,1.4]) cylinder (h=8, r=10, $fn=resol);
}

