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
        translate ([0,7,0]) cube ([34,50,2], center=true);
        /*translate ([0,0,0]) cube ([70,8,30], center=true);*/

        translate ([0,-17,3]) cube ([34,2,4], center=true);
        translate ([-16,7,3]) cube ([2,48,4], center=true);
        translate ([16,7,3]) cube ([2,48,4], center=true);
        translate ([0,29,5]) cube ([26,2,10], center=true);

        


    }
    

        translate ([-10.5,-10,-1]) cylinder (h=42, r=2.1, $fn=resol); //
        translate ([10.5,-10,-1]) cylinder (h=42, r=2.1, $fn=resol); //
    


}


