// Definitions
// **************************

innerdia = 8.4;
thick = 2;
length = 9;

//Definition of circle angular resolution
$fn = 128;  


union () {
 difference () {
 
     // main block
   translate ([0,0,0]) cylinder (h=length,r=(thick+innerdia)/2);


       
   //remove inner
   translate ([0,0,-1]) cylinder (h=length+2,r=innerdia/2);
   
  


     
   

         
 };      
};
