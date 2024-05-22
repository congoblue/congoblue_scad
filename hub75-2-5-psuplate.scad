// Definition size of housing
// **************************

//display size
length =160;
width      = 80;    
backheight = 29; //30 to fit inside box

//otuer box pillars
outerboxx=160;
outerboxy=90;
outerboxmidx=178;

//walls
backwall = 2.5;

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

    translate ([-backwall-4,-backwall-8,0]) cube([length+backwall*2+8,width+backwall*2+16,backwall]); //back
        
    translate ([-backwall-12,width/2-16,0]) cube([length+backwall*2+24,32,backwall]); 
        
    }



    //psu holes
    
    translate ([length/2-55/2,width/2+20,0]) cylinder (h=backheight+2, r=2, $fn=resol);
    translate ([length/2+55/2,width/2+20,0]) cylinder (h=backheight+2, r=2, $fn=resol);
    
    //cable tiedown

    translate ([length/2-120/2,width/2+10,00]) cylinder (h=backheight+2, r=3, $fn=resol);
    translate ([length/2-120/2,width/2+30,0]) cylinder (h=backheight+2, r=3, $fn=resol);

    //con block
    translate ([length/2-60/2,width/2-35,0]) cylinder (h=backheight+2, r=2, $fn=resol);
    translate ([length/2+60/2,width/2-35,0]) cylinder (h=backheight+2, r=2, $fn=resol);


    
    //box mount holes
    translate ([0,-(outerboxy/2-width/2),0]) cylinder (h=backheight+2, r=2, $fn=resol);
    translate ([outerboxx,-(outerboxy/2-width/2),0]) cylinder (h=backheight+2, r=2, $fn=resol);
    translate ([0,outerboxy/2+width/2,0]) cylinder (h=backheight+2, r=2, $fn=resol);
    translate ([outerboxx,outerboxy/2+width/2,0]) cylinder (h=backheight+2, r=2, $fn=resol);

    translate ([length/2-outerboxmidx/2,width/2,0]) cylinder (h=backheight+2, r=2, $fn=resol);
    translate ([length/2+outerboxmidx/2,width/2,0]) cylinder (h=backheight+2, r=2, $fn=resol);

}



