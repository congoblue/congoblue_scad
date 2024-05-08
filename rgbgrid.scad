// Definition size of housing
// **************************

pixx = 32;
pixy = 32;
pixpitch = 5;
divwidth = .8;
divheight = 6;
standoff = 1;

//Definition of circle angular resolution
resol        = 36;  


union () {
 difference () {
 
   // main block
   cube ( [pixx*pixpitch+divwidth, pixy*pixpitch+divwidth, divheight]);

   // Remove pix windows
   union () {         
     for (y=[0:pixy-1]){
       for (x=[0:pixx-1]){
         //main light hole 
         translate ( [x*pixpitch+divwidth,y*pixpitch+divwidth, -0.5] ){
           cube ( [pixpitch-divwidth, pixpitch-divwidth, divheight+1]);
         };
         //remove dividers to leave small standoffs
         translate ( [x*pixpitch-1,y*pixpitch+divwidth, divheight-standoff] ){
           cube ( [pixpitch+divwidth+2, pixpitch-divwidth, divheight+1]);
         };
         translate ( [x*pixpitch+divwidth,y*pixpitch-1, divheight-standoff] ){
           cube ( [pixpitch-divwidth, pixpitch+divwidth+2, divheight+1]);
         };

       };
   };
   /*for (y=[0:pixy]){
         //grooves on bottom for ridges on led display
         translate ( [0,y*pixpitch, -0.4] ){
           cube ( [pixx*pixpitch+divwidth, divwidth, 0.8]);
         };
   };*/
   };
         
 };      
}