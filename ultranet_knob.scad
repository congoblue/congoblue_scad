// Definitions
// **************************

inner_dia = 12;
thick = 1.2;

//Definition of circle angular resolution
$fn = 128;  

difference() {
    union() {
    translate ([0,0,0]) cylinder (h=17,r2=(inner_dia+thick*2)/2, r1=(inner_dia+thick+3)/2);

        
    }
    
    translate ([0,0,-thick/2]) cylinder (h=17-thick,r=6.05/2);
    
    
    translate ([0,0,0]) cylinder (h=6,r=inner_dia/2);


}
     
translate ([0,4.2,11]) cube ([7,4,10], center=true);



 