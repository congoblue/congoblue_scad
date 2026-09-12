
resol = 36;

difference () {

    cube ([35,51,1.4], center=true);
    
    //go btn
    translate([0,-9.5,0])
    {
    translate ([0,0,0]) cylinder(h=10, r=3.5/2, center = true, $fn = resol);
    translate ([2.5,-2.5,0]) cylinder(h=10, r=1/2, center = true, $fn = resol);
    translate ([-2.5,-5,0]) cylinder(h=10, r=1/2, center = true, $fn = resol);
    }

    //cue btn
    translate([9.5,9.5,0])
    {
    translate ([0,0,0]) cylinder(h=10, r=3.5/2, center = true, $fn = resol);
    translate ([2.5,-2.5,0]) cylinder(h=10, r=1/2, center = true, $fn = resol);
    translate ([-2.5,-5,0]) cylinder(h=10, r=1/2, center = true, $fn = resol);
    }

    //bk btn
    translate([-9.5,9.5,0])
    {
    translate ([0,0,0]) cylinder(h=10, r=3.5/2, center = true, $fn = resol);
    translate ([2.5,-2.5,0]) cylinder(h=10, r=1/2, center = true, $fn = resol);
    translate ([-2.5,-5,0]) cylinder(h=10, r=1/2, center = true, $fn = resol);
    }

    
    translate ([15,23,0]) cylinder(h=10, r=3/2, center = true, $fn = resol);
    translate ([-15,23,0]) cylinder(h=10, r=3/2, center = true, $fn = resol);
    translate ([15,-23,0]) cylinder(h=10, r=3/2, center = true, $fn = resol);
    translate ([-15,-23,0]) cylinder(h=10, r=3/2, center = true, $fn = resol);

}