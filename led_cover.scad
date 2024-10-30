// pipe
// **************************

len = 80;
wid = 35;
thick = 1;

  cube ([len,wid,thick], center=true);
  translate ([0,-wid/2-0.6,thick*.9]) rotate ([45,0,0]) cube ([len,1,2+thick], center=true);
  translate ([0,wid/2+0.6,thick*.9]) rotate ([-45,0,0]) cube ([len,1,2+thick], center=true);
   

   

