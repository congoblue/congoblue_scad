// Definition size of housing
// **************************

sizex = 50;
sizey = 15;
depth = 10;
thick = 2;
gap=2.5;

//Definition of circle angular resolution
resol        = 36;  


union () {
 difference () {
 
   union () {
   // main block
   cube ( [sizex-2, sizey, sizey] );

   rotate(a=[0,-15,0]) {
    cube ( [sizex, sizey, sizey] );
   }
       
   }
     
   //screw holes
   translate ([5,0.5,sizey/2]) {
       rotate(a=[90,0,0]) {
   cylinder ( h=8, r=1.2);
       };
   };

   translate ([5+37,0.5,sizey/2]) {
       rotate(a=[90,0,0]) {
   cylinder ( h=8, r=1.2);
       };
   };
   
   translate ([5+36.5,0.5,sizey/2 + 5]) {
       rotate(a=[90,0,0]) {
   cylinder ( h=8, r=1.2);
       };
   };

         
 };      
 
 
}