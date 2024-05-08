// Definitions
// **************************

inner_dia = 12;
thick = 1.2;

//Definition of circle angular resolution
$fn = 128;  

difference() {
    translate ([0,0,0]) cylinder (h=17,r=(inner_dia+thick*2)/2);

    translate ([0,0,-thick/2]) cylinder (h=17-thick,r=7/2);
    translate ([0,0,0]) cylinder (h=6,r=inner_dia/2);


}
     
difference() {


}



 