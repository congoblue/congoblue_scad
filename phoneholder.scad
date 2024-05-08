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
   translate ([0,0,16]) {
     cube ( [15,156,32], center = true );
   };


   
     
   //remove inner
   translate ([0,0,32]) {
   cube ( [11,156,60], center = true);
   };
   translate ([2,0,33]) {
   cube ( [14,144,60], center = true);
   };
   translate ([-2,0,35]) {
   cube ( [14,120,35], center = true);
   };

   /*translate ([8,0,60]) rotate([0,45,0]) {
   cube ( [20,170,20], center = true);
   };*/

   

         
 };      
 
 //add support fins


   translate ([6.5,-72,0]) {
   cylinder (32,1,true);
   };
   translate ([6.5,72,0]) {
   cylinder (32,1,true);
   };

   translate ([6.5,-78,0]) {
   cylinder (32,1,true);
   };
   translate ([6.5,78,0]) {
   cylinder (32,1,true);
   };

 
   translate ([-0.5,-78,16]) {
     cube ( [14,2,32], center = true );
   };

   translate ([-0.5,78,16]) {
     cube ( [14,2,32], center = true );
   };


 
}