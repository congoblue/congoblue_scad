// Definition size of housing
// **************************

sizex = 51;
sizey = 51;
depth = 10;
thick = 2;
gap=2.5;

//Definition of circle angular resolution
$fn = 36;  


union () {
 difference () {
 
   // main block
   translate ([0,0,30]) {
     cube ( [16,160,60], center = true );
   };
     
   //remove inner
   translate ([0,0,32]) {
   cube ( [12,156,60], center = true);
   };
   translate ([2,0,33]) {
   cube ( [14,142,60], center = true);
   };
   translate ([-2,0,35]) {
   cube ( [14,140,50], center = true);
   };
         
 };      
 
 //add support fins
 
   translate ([7,-71,0]) {
   cylinder (60,1,true);
   };

 
}