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
        difference() {
        translate ([0,0,0.5]) cube ([22,20,1], center=true);
            translate ([0,2.5,0]) cube ([11,5,3], center=true); //main box hole
        }

    //translate ([-7.5,6,0]) cylinder (h=1, r=1.6, $fn=resol); //
    //translate ([7.5,6,0]) cylinder (h=1, r=1.6, $fn=resol); //
      
//translate ([0,2,0.5]) cube ([15,7,5], center=true);

    }
    
    

    translate ([-7.5,6,0]) cylinder (h=42, r=1.6, $fn=resol); //
    translate ([7.5,6,0]) cylinder (h=42, r=1.6, $fn=resol); //

    //translate ([0,-20,20]) rotate ([90,90,0]) cylinder (h=15, r=9.75, $fn=resol); //mount boss od 19.5
    
    
    //translate ([0,10,0]) cube ([25,10,2], center=true);
    
    //translate ([12.5,0,0]) cube ([10,20,2], center=true);
    //translate ([-12.5,0,0]) cube ([10,20,2], center=true);

}



