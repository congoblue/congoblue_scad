offs=15;
$fn=50;
holeclear=3.5;
holethread=2.5;
thick=10;

difference()
{
union()
{
difference()
{
translate([10,0,0]) cube ([80,10,thick]);
translate([10,5,5]) cube ([80,5,5]);
}
translate([10,5,5]) rotate([0,90,0]) cylinder(h=80, d=thick);    
}
translate([10,5,5]) rotate([0,90,0]) cylinder(h=20, d=holethread);    
translate([71,5,5]) rotate([0,90,0]) cylinder(h=20, d=holethread);    

}

translate([50,-10,0]) cube ([9,10,thick]);
translate([71.4,-10,0]) cube ([10,10,thick]);


difference()
{
union()
{
linear_extrude(10) polygon(points=[[0,5+offs],[100,5+offs],[100,45+offs],[0,55+offs]]); 
translate([0,offs+5,5]) rotate([0,90,0]) cylinder(h=10, d=10);    
translate([90,offs+5,5]) rotate([0,90,0]) cylinder(h=10, d=10);    
}

translate([10,0+offs,0]) cube ([80,10,10]);
translate([0,5+offs,5]) rotate([0,90,0]) cylinder(h=20, d=holeclear);    
translate([89,5+offs,5]) rotate([0,90,0]) cylinder(h=20, d=holeclear);    
    
}

