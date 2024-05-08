// Definition size of housing
// **************************

pixx = 32;
pixy = 32;
pixpitch = 5;
divwidth = .8;
divheight = 6;
standoff = 0.4;
diffuser = 0.2;

//Definition of circle angular resolution
resol        = 36;  


union () {
 difference () {
 
   // main block
   cube ( [pixx*pixpitch+divwidth, pixy*pixpitch+divwidth, divheight+standoff]);

   // Remove pix windows
   union () {         
     for (y=[0:pixy-1]){
       for (x=[0:pixx-1]){
         //main light hole 
         translate ( [x*pixpitch+divwidth,y*pixpitch+divwidth, diffuser] ){
           cube ( [pixpitch-divwidth, pixpitch-divwidth, divheight+1]);
         };

       };
   };
   for (y=[0:pixy]){
         //grooves for ridges on led display
         translate ( [-1,y*pixpitch, divheight] ){
           cube ( [pixx*pixpitch+divwidth+2, divwidth, standoff+1]);
         };
   };
   };
         
 };  
  translate ([0,-1.8,0]) cube ( [pixx*pixpitch+divwidth, 2, 10]);  
  translate ([0,pixy*pixpitch+0.6,0]) cube ( [pixx*pixpitch+divwidth, 2, 10]);  
  
}