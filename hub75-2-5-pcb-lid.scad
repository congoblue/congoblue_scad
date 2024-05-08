// Definition size of housing
// **************************

//whole unit
length =160;
width      = 80;    
backheight = 22;

//walls
backwall = 1.8;

//corner pillars
corneroffset = 5;



//Definition of circle angular resolution
resol        = 64;           // Identical to housing !!!



difference () {
    
    union() {

    translate ([-backwall,-backwall,0]) cube([length+backwall*2,width+backwall*2,backwall]); //back
    }

    //corner holes
    translate ([corneroffset,corneroffset,0]) cylinder (h=backheight+2, r=1.6, $fn=resol);
    translate ([length-corneroffset,corneroffset,0]) cylinder (h=backheight+2, r=1.6, $fn=resol);
    translate ([corneroffset,width-corneroffset,0]) cylinder (h=backheight+2, r=1.6, $fn=resol);
    translate ([length-corneroffset,width-corneroffset,0]) cylinder (h=backheight+2, r=1.6, $fn=resol);
    
    //psu socket
    translate ([20,20,0]) cylinder (h=backheight+2, r=4.1, $fn=resol);


}

translate ([corneroffset*2+1,0,0]) cube([length-(corneroffset*2+1)*2,backwall,backwall*3]); //flange
translate ([corneroffset*2+1,width-backwall,0]) cube([length-(corneroffset*2+1)*2,backwall,backwall*3]); //flange
translate ([0,corneroffset*2+1,0]) cube([backwall,width-(corneroffset*2+1)*2,backwall*3]); //flange
translate ([length-backwall,corneroffset*2+1,0]) cube([backwall,width-(corneroffset*2+1)*2,backwall*3]); //flange

