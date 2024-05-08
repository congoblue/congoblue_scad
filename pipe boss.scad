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

        translate ([0,0,0]) cylinder (h=35, r=21, $fn=resol);
        translate ([0,0,0]) cylinder (h=15, r=27, $fn=resol);
        translate ([0,0,0]) cube ([70,8,30], center=true);
        translate ([33,0,15]) cube ([4,8,4], center=true);
        translate ([-33,0,15]) cube ([4,8,4], center=true);

    }

    translate ([0,0,0]) cylinder (h=40, r=17.5, $fn=resol); //hole for pipe - 34.5mm od

    translate ([-50,0,-45]) rotate ([0,90,0]) cylinder (h=100, r=55, $fn=resol); //boss


}

difference () {

    translate ([0,0,0]) cylinder (h=15, r=20, $fn=resol); //into pipe - saw hole size
    translate ([0,0,0]) cylinder (h=16, r=17.5, $fn=resol); //hole for pipe - 32mm od

    translate ([-50,0,-48]) rotate ([0,90,0]) cylinder (h=100, r=55, $fn=resol); //boss


}


