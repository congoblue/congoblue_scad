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

    translate ([0,0,0]) cube([length,width,height]); //back
    }

    translate ([(length-cutoutlength)/2,(width-cutoutwidth)/2,0]) cube([cutoutlength,cutoutwidth,height+1]); //back
    //translate ([length-20,width/2,-1]) cylinder (h=8+2, r=2.5, $fn=resol);
}

