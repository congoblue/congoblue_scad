
resol = 36;

difference () {

    cube ([25,78,1.4], center=true);

    translate ([-12,-38,0]) cube ([10,10,2], center=true);
    translate ([12,-38,0]) cube ([10,10,2], center=true);
    translate ([-12,38,0]) cube ([10,10,2], center=true);
    translate ([12,38,0]) cube ([10,10,2], center=true);

    
    translate ([-10,-30,0]) cylinder(h=10, r=3/2, center = true, $fn = resol);
    translate ([10,-30,0]) cylinder(h=10, r=3/2, center = true, $fn = resol);
    translate ([-10,30,0]) cylinder(h=10, r=3/2, center = true, $fn = resol);
    translate ([10,30,0]) cylinder(h=10, r=3/2, center = true, $fn = resol);

    translate ([4,65/2,0]) cylinder(h=10, r=1/2, center = true, $fn = resol);
    translate ([4,-65/2,0]) cylinder(h=10, r=1/2, center = true, $fn = resol);

    translate ([-4,63/2,0]) cylinder(h=10, r=1/2, center = true, $fn = resol);
    translate ([-4,-63/2,0]) cylinder(h=10, r=1/2, center = true, $fn = resol);

    translate ([3.5/2,-74/2,0]) cylinder(h=10, r=1/2, center = true, $fn = resol);
    translate ([-3.5/2,-74/2,0]) cylinder(h=10, r=1/2, center = true, $fn = resol);
    translate ([-3.5/2,74/2,0]) cylinder(h=10, r=1/2, center = true, $fn = resol);


}