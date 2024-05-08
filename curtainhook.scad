// Definition size of housing
// **************************

width      = 26;    
height      = 30;     
space     = 3;
wall        = 2;
grip = 5;

dia     = 15;            
clipwid     = 10;
clipextra =4; //this is the height of the extra curve on the clip
clipgrip =5; //this is the extra straight bit on the clip

//Definition of circle angular resolution
resol        = 64;           // Identical to housing !!!



    translate ([0,-wall,0]) cube([width,wall,height]); //back
    translate ([-wall,-wall,0]) cube([wall,space+wall*2,height]); //side
    translate ([width,-wall,0]) cube([wall,space+wall*2,height]); //side
    translate ([0,space,0]) cube([grip,wall,height]); //curtain hold 1
    translate ([width-grip,space,0]) cube([grip,wall,height]); //curtain hold 2
    
    translate ([width/2-clipwid/2,-dia/2-wall,0]) cube([clipwid,dia/2,wall]); //clip flat top



difference () {
    translate ([width/2-clipwid/2,-dia/2-wall,dia/2+wall]) rotate ([0,90,0]) cylinder ( h=clipwid, r=wall+dia/2, center=false, $fn = resol);

    translate ([width/2-clipwid/2-1,-dia/2-wall,dia/2+wall]) rotate ([0,90,0]) cylinder ( h=clipwid+2, r=dia/2, center=false, $fn = resol);

    translate ([width/2-clipwid/2-1,-dia/2-wall,dia/2+wall]) cube([clipwid+2,dia/2,wall*2+dia]); //remove inside part

    translate ([width/2-clipwid/2-1,-dia-wall*2,wall+dia/2+clipextra]) cube([clipwid+2,dia/2+wall,wall*2+dia]); //remove outside part

}

    translate ([width/2-clipwid/2,-dia-wall*2+1,dia/2+wall+clipextra]) cube([clipwid,wall,clipgrip]); //clip straight grip section

    translate ([width/2-clipwid/2,-wall*2,0]) cube([clipwid,wall,wall*2]); //infill back of clip

