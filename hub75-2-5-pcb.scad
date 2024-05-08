// Definition size of housing
// **************************

//display size
length =160;
width      = 80;    
backheight = 32; //30 to fit inside box

//walls
backwall = 1.8;

//corner pillars
corneroffset = 5;

//display holes
holex = 17;
holey = 7.5;
holew = 125;
holeh = 65;

//pcb holes
pcbw = 84;
pcbh = 63;
pcboffsx = 10;
pcboffsy = 1;
pcbheight      = 5; //pcb standoff

//display rear cutout
cutoutlength = 135;
cutoutwidth = 52;




//Definition of circle angular resolution
resol        = 64;           // Identical to housing !!!



difference () {
    
    union() {

    translate ([-backwall,-backwall,0]) cube([length+backwall*2,width+backwall*2,backheight]); //back
    }

    translate ([(length-cutoutlength)/2,(width-cutoutwidth)/2,0]) cube([cutoutlength,cutoutwidth,backheight+1]); //display hole
    translate ([0,0,backwall]) cube([length,width,backheight+1]); //back inside

    //display fix holes
    translate ([holex,holey,-1]) cylinder (h=backheight+2, r=1.6, $fn=resol);
    translate ([holex,holey+holeh,-1]) cylinder (h=backheight+2, r=1.6, $fn=resol);
    translate ([holex+holew,holey,-1]) cylinder (h=backheight+2, r=1.6, $fn=resol);
    translate ([holex+holew,holey+holeh,-1]) cylinder (h=backheight+2, r=1.6, $fn=resol);
    
    //plastic pips
    translate ([7.5,25,-1]) cylinder (h=backheight+2, r=1.5, $fn=resol);
    translate ([length-7.5,width-25,-1]) cylinder (h=backheight+2, r=1.5, $fn=resol);
}

difference () {
    //pcb mount pillars
    union() {
    translate ([holex+pcboffsx,holey+pcboffsy,backwall]) cylinder (h=pcbheight, r=5.5, $fn=resol);
    translate ([holex+pcboffsx,holey+pcboffsy+pcbh,backwall]) cylinder (h=pcbheight, r=5.5, $fn=resol);
    translate ([holex+pcbw+pcboffsx,holey+pcboffsy,backwall]) cylinder (h=pcbheight, r=5.5, $fn=resol);
    translate ([holex+pcbw+pcboffsx,holey+pcboffsy+pcbh,backwall]) cylinder (h=pcbheight, r=5.5, $fn=resol);
    }

    //pcb mount holes
    translate ([holex+pcboffsx,holey+pcboffsy,backwall]) cylinder (h=backheight+2, r=2, $fn=resol);
    translate ([holex+pcboffsx,holey+pcboffsy+pcbh,backwall]) cylinder (h=backheight+2, r=2, $fn=resol);
    translate ([holex+pcbw+pcboffsx,holey+pcboffsy,backwall]) cylinder (h=backheight+2, r=2, $fn=resol);
    translate ([holex+pcbw+pcboffsx,holey+pcboffsy+pcbh,backwall]) cylinder (h=backheight+2, r=2, $fn=resol);
}


//corner pillars
difference () {
    //corner pillars
    union() {
    translate ([corneroffset,corneroffset,0]) cylinder (h=backheight, r=5.5, $fn=resol);
    translate ([length-corneroffset,corneroffset,0]) cylinder (h=backheight, r=5.5, $fn=resol);
    translate ([corneroffset,width-corneroffset,0]) cylinder (h=backheight, r=5.5, $fn=resol);
    translate ([length-corneroffset,width-corneroffset,0]) cylinder (h=backheight, r=5.5, $fn=resol);
    }

    //corner holes
    translate ([corneroffset,corneroffset,backwall]) cylinder (h=backheight+2, r=2, $fn=resol);
    translate ([length-corneroffset,corneroffset,backwall]) cylinder (h=backheight+2, r=2, $fn=resol);
    translate ([corneroffset,width-corneroffset,backwall]) cylinder (h=backheight+2, r=2, $fn=resol);
    translate ([length-corneroffset,width-corneroffset,backwall]) cylinder (h=backheight+2, r=2, $fn=resol);
}
