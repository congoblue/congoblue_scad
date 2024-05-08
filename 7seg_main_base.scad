// Definition size of housing
// **************************

sizex = 150;
sizey = 25;
depth = 10;
thick = 2;
gap=2.5;

//Definition of circle angular resolution
resol        = 36;  


union () {
 difference () {
 
   // main block
   translate ([0,0,0]) {
     cube ( [sizex, sizey, depth], center=true );
   };
     
   //angled end
   translate ([-sizex/2,sizey-2,0]) {
   rotate ([0,0,45])
   cube ( [sizey*2, sizey*2, depth+10], center=true);
   };
   translate ([sizex/2,sizey-2,0]) {
   rotate ([0,0,-45])
   cube ( [sizey*2, sizey*2, depth+10], center=true);
   };
   
   //remove inner
   translate ([-sizex/2,thick,thick]) {
   cube ( [sizex, depth, sizey]);
   };

         
 };      



 
 //add support fins
   /*
   translate ([2,thick,thick+gap]) {
   cube ( [sizex/2-thick*2-5, depth-2 , thick]);
   };

   translate ([+2 -sizex/2 +5 ,thick,thick+gap]) {
   cube ( [sizex/2-thick*2-5, depth-2 , thick]);
   };

   translate ([sizex/2-gap-thick,thick,thick+gap+5]) {
   cube ( [thick, depth-2 , sizex-thick*2 - 20]);
   };

   translate ([-(sizex/2-thick),thick,thick+gap+5]) {
   cube ( [thick, depth-2 , sizex-thick*2 - 20]);
   };
 */
}