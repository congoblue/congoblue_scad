
thick      = 2;


difference () {

  union() {
  translate ([0,0,0]) cube ([200,100,thick]); //top

  }


  for (j=[1:8:100]){
  for (i=[4:8:200]) {
      
      translate ([i,j,-5]) rotate([0,0,45])  cube ([5,5,thick+10]);
  }
  }

  for (j=[-3:8:100]){
  for (i=[0:8:200]) {
      
      translate ([i,j,-5]) rotate([0,0,45])  cube ([5,5,thick+10]);
  }
  }


}
 
