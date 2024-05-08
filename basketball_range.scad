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
        translate ([0,9,15]) cube ([30,48,30], center=true);
        /*translate ([0,0,0]) cube ([70,8,30], center=true);*/

        translate ([0,36.5,14]) rotate([15,0,0]) cube ([116,2,33], center=true);
        translate ([57,38,14.5]) rotate([15,0,0]) cube ([2,2,33], center=true);
        translate ([-57,38,14.5]) rotate([15,0,0]) cube ([2,2,33], center=true);

        translate ([0,34.5,3]) cube ([30,10,6], center=true);
        


    }
    
    

    //translate ([-7.5,0,0]) cylinder (h=42, r=1.75, $fn=resol); //
    //translate ([7.5,0,0]) cylinder (h=42, r=1.75, $fn=resol); //

    //translate ([0,-20,20]) rotate ([90,90,0]) cylinder (h=15, r=9.75, $fn=resol); //mount boss od 19.5
    
    translate ([0,9,16]) cube ([27,45,30], center=true); //main box hole
    
    translate ([0,8,0]) cube ([8,6,30], center=true); //sensor hole

    translate ([0,0,-3]) cube ([150,100,6], center=true); //bottom face cut

        translate ([0,-8,6]) rotate ([90,0,0]) cylinder (h=10, r=2, $fn=resol); //

}

difference () {
    
    union() {
        translate ([-7.5,13,0]) cylinder (h=7, r=3, $fn=resol); //
        translate ([7.5,13,0]) cylinder (h=7, r=3, $fn=resol); //
        translate ([0,8,3.5]) cube ([10,8,7], center=true);

        translate ([-10.5,-10,0]) cylinder (h=30, r=4, $fn=resol); //
        translate ([10.5,-10,0]) cylinder (h=30, r=4, $fn=resol); //


    }

        translate ([-7.5,13,0]) cylinder (h=42, r=2.1, $fn=resol); //
        translate ([7.5,13,0]) cylinder (h=42, r=2.1, $fn=resol); //

        translate ([-10.5,-10,0]) cylinder (h=42, r=2.1, $fn=resol); //
        translate ([10.5,-10,0]) cylinder (h=42, r=2.1, $fn=resol); //


    translate ([0,8,0]) cube ([8,6,30], center=true);

}

