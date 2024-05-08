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

        translate ([0,0,0]) cylinder (h=40, r=29.5, $fn=resol); //cam band
        translate ([0,0,0]) cylinder (h=15, r=27, $fn=resol); //mount boss od 19.5
        /*translate ([0,0,0]) cube ([70,8,30], center=true);*/



    }
    
    

    translate ([0,0,0]) cylinder (h=42, r=27.7, $fn=resol); //hole for cam - 55mm od

    translate ([0,-20,20]) rotate ([90,90,0]) cylinder (h=15, r=9.75, $fn=resol); //mount boss od 19.5
    
    translate ([0,-20,35]) cube ([19.5,19.5,30], center=true);

    translate ([0,-27.5,0]) cube ([2,2,42], center=true);
    translate ([0,27.5,20]) cube ([2,2,42], center=true);


    /*translate ([-50,0,-45]) rotate ([0,90,0]) cylinder (h=100, r=55, $fn=resol); //boss*/


}



