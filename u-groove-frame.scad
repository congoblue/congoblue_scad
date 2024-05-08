// Definitions
// **************************

wheeldia = 60;
thick = 3;
bolt =8.2;
wheelwidth=9+7+9;

//Definition of circle angular resolution
$fn = 128;  


 difference () {
 
    cylinder (h=24,r=31/2);
     
    cylinder (h=25,r=21/2);
     
    translate ([0,20,13]) rotate ([90,0,0]) cylinder (h=40,r=7/2);
         
 };      


 