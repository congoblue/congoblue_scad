/* [Enclosure options] */
includeFrontCover = "Y"; // [Y:Yes, N:No]
enclosureX = 110.0; // .1
enclosureY = 65.0; // .1
enclosureFrontZ = 16.0; // .1
includeRearCover = "Y"; // [Y:Yes, N:No]
enclosureRearZ = 5.0; // .1
enclosureWallThickness = 1.2; // .1
cornerStyle = "R"; // [S:Square, R:Rounded]
enclosureCornerRadius = 5.0; // .1
bevelFrontOfEnclosure = "Y"; // [Y:Yes, N:No]
bevelRearOfEnclosure = "Y"; // [Y:Yes, N:No]
bevelWidth = 2.0; // .1
bevelZ = 2.0; // .1
/* [Screen options] */
bezelZ = 3; // .1
centerOnVisibleArea = "Y"; // [Y:Yes, N:No]
bevelDisplayOpening = "Y"; // [Y:Yes, N:No]
/* [Mounting screw options] */
frontMountingScrews = "Y"; // [Y:Yes, N:No]
mountingScrewDiameter = 3.2; // .1
countersinkMountingScrew = "Y"; // [Y:Yes, N:No]
mountingScrewHeadBaseDiameter = 5.7; // .1
mountingScrewHeadTopDiameter = 5.7; // .1
mountingScrewHeadZ = 3.0; // .1
mountingScrewOffset = 2; // .1
/* [CYD options] */
ldrPinHole = "Y"; // [Y:Yes, N:No]
usbCutout = "Y"; // [Y:Yes, N:No]
sdCardCutout = "E"; // [N:None, I:Internal, E:External]
cn1Cutout = "I"; // [N:None, I:Internal, E:External]
p1Cutout = "I"; // [N:None, I:Internal, E:External]
p3Cutout = "I"; // [N:None, I:Internal, E:External]
module __Customizer_Limit__ () {}  // This actually works
$fn=50;
cydCutoutZ = 5.8;
cydCutoutX = 86.5;
cydCutoutY = 50.5;
cydCornerR = 4;
cydScrewXspacing = 78;
cydScrewYspacing = 42;
cydScrewR = 1.3;	//Assume self-tap
antennaX = 8;
antennaY = 28;
antennaYoffset = -4;
displayX = 72;
displayY = cydCutoutY;
displayZ = 4;
visibleAreaX = 59.6;
visibleAreaY = 45.8;
visibleAreaXoffset = 3.5;
ldrX = 4;
ldrY = 7;
ldrZ = 2;
ldrXoffset = 1.5;
ldrYoffset = 7;
connectorX = 7.5;
connectorY = 3.5;
connectorZ = 3.5;
p1Xoffset = -0.01;
p1Yoffset = 12.5;
p1Zoffset = 1.6;
p3Xoffset = 11.5;
p3Yoffset = 0.01;
p3Zoffset = 1.6;
cn1Xoffset = 27.5;
cn1Yoffset = 0.01;
cn1Zoffset = 1.6;
sdCardX = 12;
sdCardY = 3;
sdCardZ = 2;
sdCardXoffset = 43;
sdCardYoffset = 0.01;
sdCardZoffset = 2.2;
usbX1 = 1.5;
usbY1 = 6;
usbZ1 = 1;
usbX2 = usbX1;
usbY2 = 9;
usbZ2 = 2.5;
usbYoffset = 9.7;
usbZoffset = 1;
usbPlugX = 30;
usbPlugY = 12;
usbPlugZ = 9;
usbPlugZoffset = 4;
usbPlugYoffset = 9.7;
displayFudge = 0.001;

if(includeFrontCover == "Y")
{
	frontCover();
}
if(includeRearCover == "Y")
{
	if(includeFrontCover == "Y")
	{
		translate([0,enclosureY+bevelWidth+5,0])
		rearCover();
	}
	else
	{
		rearCover();
	}
}

module frontCover()
{
	difference()
	{
		if(centerOnVisibleArea == "Y")
		{
			translate([visibleAreaXoffset,0,0])
			translate([-enclosureX/2,-enclosureY/2,0])
			enclosureFrontOuter();
		}
		else
		{
			translate([-enclosureX/2,-enclosureY/2,0])
			enclosureFrontOuter();
		}
		//translate([0,0,enclosureFrontZ-cydZoffset])
		cydCutout(bezelZ,enclosureFrontZ);
		frontCoverCutout();
	}
}
module frontCoverCutout()
{
	frontCoverCutoutZ = enclosureFrontZ - (cydCutoutZ + displayZ + bevelZ);
	if(frontMountingScrews == "Y")
	{
		if(bevelFrontOfEnclosure == "Y")
		{
			if(centerOnVisibleArea == "N")
			{
				translate([-visibleAreaXoffset,0,0])
				{
				translate([-(cydCutoutX)/2,-(enclosureY-enclosureWallThickness*4-mountingScrewDiameter*4)/2,-displayFudge])
				cube([enclosureX-enclosureWallThickness*2-mountingScrewDiameter*2,enclosureY-enclosureWallThickness*4-mountingScrewDiameter*4,frontCoverCutoutZ]);
				translate([-(cydCutoutX)/2,-(enclosureY-enclosureWallThickness*2)/2,-displayFudge])
				cube([enclosureX-enclosureWallThickness*4-mountingScrewDiameter*4,enclosureY-enclosureWallThickness*2,frontCoverCutoutZ]);
				}
			}
			else
			{
				translate([-(cydCutoutX)/2,-(enclosureY-enclosureWallThickness*4-mountingScrewDiameter*4)/2,-displayFudge])
				cube([enclosureX-enclosureWallThickness*2-mountingScrewDiameter*2,enclosureY-enclosureWallThickness*4-mountingScrewDiameter*4,frontCoverCutoutZ]);
				translate([-(cydCutoutX)/2,-(enclosureY-enclosureWallThickness*2)/2,-displayFudge])
				cube([enclosureX-enclosureWallThickness*4-mountingScrewDiameter*4,enclosureY-enclosureWallThickness*2,frontCoverCutoutZ]);
			}
			translate([cydCutoutX/2-displayFudge,-(cydCutoutY-cydCornerR*2)/2,-displayFudge])
			if(centerOnVisibleArea == "Y")
			{
				cube([(enclosureX-cydCutoutX)/2+bevelWidth,cydCutoutY-cydCornerR*2,frontCoverCutoutZ+displayZ+cydCutoutZ]);
			}
			else
			{
				cube([(enclosureX-cydCutoutX)/2+bevelWidth-visibleAreaXoffset,cydCutoutY-cydCornerR*2,frontCoverCutoutZ+displayZ+cydCutoutZ]);
			}
		}
		else
		{
			if(centerOnVisibleArea == "N")
			{
				translate([-(cydCutoutX)/2,-(enclosureY-enclosureWallThickness*4-mountingScrewDiameter*4)/2,-displayFudge])
				cube([enclosureX-enclosureWallThickness*4-mountingScrewDiameter*2-visibleAreaXoffset,enclosureY-enclosureWallThickness*4-mountingScrewDiameter*4,frontCoverCutoutZ]);
				translate([-(cydCutoutX)/2,-(enclosureY-enclosureWallThickness*4)/2,-displayFudge])
				cube([enclosureX-enclosureWallThickness*4-mountingScrewDiameter*4-visibleAreaXoffset,enclosureY-enclosureWallThickness*4,frontCoverCutoutZ]);
			}
			else
			{
				translate([-(cydCutoutX)/2,-(enclosureY-enclosureWallThickness*4-mountingScrewDiameter*4)/2,-displayFudge])
				cube([enclosureX-enclosureWallThickness*4-mountingScrewDiameter*2,enclosureY-enclosureWallThickness*4-mountingScrewDiameter*4,frontCoverCutoutZ]);
				translate([-(cydCutoutX)/2,-(enclosureY-enclosureWallThickness*4)/2,-displayFudge])
				cube([enclosureX-enclosureWallThickness*4-mountingScrewDiameter*4,enclosureY-enclosureWallThickness*4,frontCoverCutoutZ]);
			}
			translate([cydCutoutX/2-displayFudge,-(cydCutoutY-cydCornerR*2)/2,-displayFudge])
			if(centerOnVisibleArea == "Y")
			{
				cube([(enclosureX-cydCutoutX)/2+bevelWidth-enclosureWallThickness,cydCutoutY-cydCornerR*2,frontCoverCutoutZ+displayZ+cydCutoutZ]);
			}
			else
			{
				cube([(enclosureX-cydCutoutX)/2+bevelWidth-visibleAreaXoffset-enclosureWallThickness,cydCutoutY-cydCornerR*2,frontCoverCutoutZ+displayZ+cydCutoutZ]);
			}
		}
	}
	else
	{
		translate([-(enclosureX-enclosureWallThickness*2)/2,-(enclosureY-enclosureWallThickness*2)/2,-displayFudge])
		cube([enclosureX-enclosureWallThickness*2,enclosureY-enclosureWallThickness*2,frontCoverCutoutZ]);
	}
}
module rearCover()
{
	difference()
	{
		if(centerOnVisibleArea == "Y")
		{
			translate([visibleAreaXoffset,0,0])
			translate([-enclosureX/2,-enclosureY/2,0])
		enclosureRearOuter();
		}
		else
		{
			translate([-enclosureX/2,-enclosureY/2,0])
		enclosureRearOuter();
		}
		//Space under the PCB
		if(enclosureX > cydCutoutX+4 && enclosureY > cydCutoutY+4)
		{
			translate([-(cydCutoutX+2)/2,-(cydCutoutY+2)/2,-displayFudge])
			cube([cydCutoutX+2,cydCutoutY+2,enclosureRearZ-enclosureWallThickness]);
		}
		if(centerOnVisibleArea == "Y")
		{
			translate([visibleAreaXoffset,0,0])
			rearCoverCutout();
		}
		else
		{
			rearCoverCutout();
		}
	}
}
module rearCoverCutout()
{
	//Hollow out generally
	if(frontMountingScrews == "Y")
	{
		if(bevelRearOfEnclosure == "Y")
		{
			translate([-(enclosureX-enclosureWallThickness*4-mountingScrewDiameter*4)/2,-(enclosureY+bevelWidth-enclosureWallThickness*2)/2,-displayFudge-bevelZ])
			cube([enclosureX-enclosureWallThickness*4-mountingScrewDiameter*4,enclosureY+bevelWidth-enclosureWallThickness*2,enclosureRearZ-enclosureWallThickness]);
			translate([-(enclosureX+bevelWidth-enclosureWallThickness*4)/2,-(enclosureY-enclosureWallThickness*2-mountingScrewDiameter*4)/2,-displayFudge-bevelZ])
			cube([enclosureX+bevelWidth-enclosureWallThickness*4,enclosureY-enclosureWallThickness*2-mountingScrewDiameter*4,enclosureRearZ-enclosureWallThickness]);
			translate([-(enclosureX-enclosureWallThickness*4-mountingScrewDiameter*4)/2,-(enclosureY-enclosureWallThickness*2)/2,-displayFudge])
			cube([enclosureX-enclosureWallThickness*4-mountingScrewDiameter*4,enclosureY-enclosureWallThickness*2,enclosureRearZ-enclosureWallThickness]);
			translate([-(enclosureX-enclosureWallThickness*4)/2,-(enclosureY-enclosureWallThickness*2-mountingScrewDiameter*4)/2,-displayFudge])
			cube([enclosureX-enclosureWallThickness*4,enclosureY-enclosureWallThickness*2-mountingScrewDiameter*4,enclosureRearZ-enclosureWallThickness]);
		}
		else
		{
			if(bevelFrontOfEnclosure == "Y")
			{
				translate([-(enclosureX-enclosureWallThickness*4-mountingScrewDiameter*4+bevelWidth)/2,-(enclosureY-enclosureWallThickness*4+bevelWidth)/2,-displayFudge])
				cube([enclosureX-enclosureWallThickness*4-mountingScrewDiameter*4+bevelWidth,enclosureY-enclosureWallThickness*4+bevelWidth,enclosureRearZ-enclosureWallThickness]);
				translate([-(enclosureX-enclosureWallThickness*4+bevelWidth)/2,-(enclosureY-enclosureWallThickness*2-mountingScrewDiameter*4)/2,-displayFudge])
				cube([enclosureX-enclosureWallThickness*4+bevelWidth,enclosureY-enclosureWallThickness*2-mountingScrewDiameter*4,enclosureRearZ-enclosureWallThickness]);
			}
			else
			{
			translate([-(enclosureX-enclosureWallThickness*4-mountingScrewDiameter*4)/2,-(enclosureY-enclosureWallThickness*4)/2,-displayFudge])
			cube([enclosureX-enclosureWallThickness*4-mountingScrewDiameter*4,enclosureY-enclosureWallThickness*4,enclosureRearZ-enclosureWallThickness]);			translate([-(enclosureX-enclosureWallThickness*4)/2,-(enclosureY-enclosureWallThickness*2-mountingScrewDiameter*4)/2,-displayFudge])
			cube([enclosureX-enclosureWallThickness*4,enclosureY-enclosureWallThickness*2-mountingScrewDiameter*4,enclosureRearZ-enclosureWallThickness]);
			}
		}
	}
	else
	{
		translate([-(enclosureX-enclosureWallThickness*2)/2,-(enclosureY-enclosureWallThickness*2)/2,-displayFudge])
		cube([enclosureX-enclosureWallThickness*2,enclosureY-enclosureWallThickness*2,enclosureRearZ-enclosureWallThickness]);
	}
}

module enclosureFrontOuter()
{
	difference()
	{
		if(cornerStyle == "R")
		{
			if(bevelFrontOfEnclosure == "Y")
			{
				hull()
				{
					if(bevelZ == enclosureFrontZ)
					{
						translate([-bevelWidth,-bevelWidth,0])
						roundedCornerCube(enclosureX+bevelWidth*2,enclosureY+bevelWidth*2,displayFudge,enclosureCornerRadius+bevelWidth/2);
						roundedCornerCube(enclosureX,enclosureY,enclosureFrontZ,enclosureCornerRadius);
					}
					else
					{
						translate([-bevelWidth,-bevelWidth,0])
						roundedCornerCube(enclosureX+bevelWidth*2,enclosureY+bevelWidth*2,enclosureFrontZ-bevelZ,enclosureCornerRadius+bevelWidth/2);
						translate([0,0,enclosureFrontZ-bevelZ])
						roundedCornerCube(enclosureX,enclosureY,bevelZ,enclosureCornerRadius);
					}
				}
			}
			else
			{
				roundedCornerCube(enclosureX,enclosureY,enclosureFrontZ,enclosureCornerRadius);
			}
		}
		else
		{
			if(bevelFrontOfEnclosure == "Y")
			{
				hull()
				{
					if(bevelZ == enclosureFrontZ)
					{
						translate([-bevelWidth,-bevelWidth,0])
						cube([enclosureX+bevelWidth*2,enclosureY+bevelWidth*2,displayFudge]);
						cube([enclosureX,enclosureY,enclosureFrontZ]);
					}
					else
					{
						translate([-bevelWidth,-bevelWidth,0])
						cube([enclosureX+bevelWidth*2,enclosureY+bevelWidth*2,enclosureFrontZ-bevelZ]);
						cube([enclosureX,enclosureY,enclosureFrontZ]);
					}
				}
			}
			else
			{
				cube([enclosureX,enclosureY,enclosureFrontZ]);
			}
		}
		if(frontMountingScrews == "Y")
		{
			translate([mountingScrewDiameter+mountingScrewOffset,mountingScrewDiameter+mountingScrewOffset,-displayFudge])
			mountingScrew();
			translate([mountingScrewDiameter+mountingScrewOffset,enclosureY-(mountingScrewDiameter+mountingScrewOffset),-displayFudge])
			mountingScrew();
			translate([enclosureX-(mountingScrewDiameter+mountingScrewOffset),(mountingScrewDiameter+mountingScrewOffset),-displayFudge])
			mountingScrew();
			translate([enclosureX-(mountingScrewDiameter+mountingScrewOffset),enclosureY-(mountingScrewDiameter+mountingScrewOffset),-displayFudge])
			mountingScrew();
		}
	}
}
module enclosureRearOuter()
{
	difference()
	{
		if(cornerStyle == "R")
		{
			if(bevelRearOfEnclosure == "Y")
			{
				hull()
				{
					if(bevelZ == enclosureRearZ)
					{
						translate([-bevelWidth,-bevelWidth,0])
						roundedCornerCube(enclosureX+bevelWidth*2,enclosureY+bevelWidth*2,displayFudge,enclosureCornerRadius+bevelWidth/2);
						roundedCornerCube(enclosureX,enclosureY,enclosureRearZ,enclosureCornerRadius);
					}
					else
					{
						translate([-bevelWidth,-bevelWidth,0])
						roundedCornerCube(enclosureX+bevelWidth*2,enclosureY+bevelWidth*2,enclosureRearZ-bevelZ,enclosureCornerRadius+bevelWidth/2);
						translate([0,0,enclosureRearZ-bevelZ])
						roundedCornerCube(enclosureX,enclosureY,bevelZ,enclosureCornerRadius);
					}
				}
			}
			else
			{
				if(bevelFrontOfEnclosure == "Y")
				{
					translate([-bevelWidth,-bevelWidth,0])
					roundedCornerCube(enclosureX+bevelWidth*2,enclosureY+bevelWidth*2,enclosureRearZ,enclosureCornerRadius+bevelWidth/2);				}
				else
				{
					roundedCornerCube(enclosureX,enclosureY,enclosureRearZ,enclosureCornerRadius);
				}
			}
		}
		else
		{
			if(bevelRearOfEnclosure == "Y")
			{
				hull()
				{
					if(bevelZ == enclosureFrontZ)
					{
						translate([-bevelWidth,-bevelWidth,0])
						cube([enclosureX+bevelWidth*2,enclosureY+bevelWidth*2,displayFudge]);
						cube([enclosureX,enclosureY,enclosureFrontZ]);
					}
					else
					{
						translate([-bevelWidth,-bevelWidth,0])
						cube([enclosureX+bevelWidth*2,enclosureY+bevelWidth*2,enclosureFrontZ-bevelZ]);
						cube([enclosureX,enclosureY,enclosureFrontZ]);
					}
				}
			}
			else
			{
				if(bevelFrontOfEnclosure == "Y")
				{
					translate([-bevelWidth,-bevelWidth,0])
					cube([enclosureX+bevelWidth*2,enclosureY+bevelWidth*2,enclosureFrontZ]);
				}
				else
				{
					cube([enclosureX,enclosureY,enclosureFrontZ]);
				}
			}
		}
		if(frontMountingScrews == "Y")
		{
			translate([mountingScrewDiameter+mountingScrewOffset,mountingScrewDiameter+mountingScrewOffset,-displayFudge])
			cylinder(d=mountingScrewDiameter-0.5,h=enclosureRearZ-1);
			translate([mountingScrewDiameter+mountingScrewOffset,enclosureY-(mountingScrewDiameter+mountingScrewOffset),-displayFudge])
			cylinder(d=mountingScrewDiameter-0.5,h=enclosureRearZ-1);
			translate([enclosureX-(mountingScrewDiameter+mountingScrewOffset),(mountingScrewDiameter+mountingScrewOffset),-displayFudge])
			cylinder(d=mountingScrewDiameter-0.5,h=enclosureRearZ-1);
			translate([enclosureX-(mountingScrewDiameter+mountingScrewOffset),enclosureY-(mountingScrewDiameter+mountingScrewOffset),-displayFudge])
			cylinder(d=mountingScrewDiameter-0.5,h=enclosureRearZ-1);
		}
	}
}
module mountingScrew()
{
	union()
	{
		cylinder(d=mountingScrewDiameter,h=enclosureFrontZ+displayFudge);
		if(countersinkMountingScrew == "Y")
		{
			translate([0,0,enclosureFrontZ-mountingScrewHeadZ])
			cylinder(d1=mountingScrewHeadBaseDiameter, d2=mountingScrewHeadTopDiameter, h=mountingScrewHeadZ+displayFudge*2);
		}
	}
}
module cydCutout(bezelDepth,depth)
{
	//cutoutZ
	translate([0,0,depth-(cydCutoutZ+displayZ+bezelDepth)])
	{
		union()
		{
			//Main PCB cutout
			hull()
			{
				translate([-(cydCutoutX-cydCornerR*2)/2,-(cydCutoutY-cydCornerR*2)/2,-displayFudge])
				cylinder(r=cydCornerR,h=cydCutoutZ+displayFudge);
				translate([-(cydCutoutX-cydCornerR*2)/2,(cydCutoutY-cydCornerR*2)/2,-displayFudge])
				cylinder(r=cydCornerR,h=cydCutoutZ+displayFudge);
				translate([(cydCutoutX-cydCornerR*2)/2,-(cydCutoutY-cydCornerR*2)/2,-displayFudge])
				cylinder(r=cydCornerR,h=cydCutoutZ+displayFudge);
				translate([(cydCutoutX-cydCornerR*2)/2,(cydCutoutY-cydCornerR*2)/2,-displayFudge])
				cylinder(r=cydCornerR,h=cydCutoutZ+displayFudge);
			}
			//Space under the PCB
			if(depth-(cydCutoutZ+displayZ+bezelDepth) > 0 && enclosureX > cydCutoutX+4 && enclosureY > cydCutoutY+4)
			{
				translate([-(cydCutoutX)/2,-(cydCutoutY)/2,-(depth-(cydCutoutZ+displayZ+bezelDepth))-displayFudge])
				cube([cydCutoutX,cydCutoutY,depth-(cydCutoutZ+displayZ+bezelDepth-displayFudge*2)]);
			}
			//Antenna cutout
			translate([cydCutoutX/2-antennaX,antennaYoffset-antennaY/2,cydCutoutZ])
			cube([antennaX,antennaY,displayZ]);
			//Opposite cutout
			translate([-cydCutoutX/2,-35/2,cydCutoutZ])
			cube([antennaX,35,displayZ]);
			//Mounting screws
			translate([-cydScrewXspacing/2,-cydScrewYspacing/2,cydCutoutZ])
			cylinder(r=cydScrewR,h=displayZ+bezelDepth - 1);
			translate([-cydScrewXspacing/2,cydScrewYspacing/2,cydCutoutZ])
			cylinder(r=cydScrewR,h=displayZ+bezelDepth - 1);
			translate([cydScrewXspacing/2,-cydScrewYspacing/2,cydCutoutZ])
			cylinder(r=cydScrewR,h=displayZ+bezelDepth - 1);
			translate([cydScrewXspacing/2,cydScrewYspacing/2,cydCutoutZ])
			cylinder(r=cydScrewR,h=displayZ+bezelDepth - 1);
			//Display body
			translate([-displayX/2,-displayY/2,cydCutoutZ-displayFudge])
			cube([displayX,displayY,displayZ+displayFudge]);
			//Viewable Area
			translate([visibleAreaXoffset-visibleAreaX/2,-visibleAreaY/2,cydCutoutZ+displayZ-displayFudge])
			if(bevelDisplayOpening == "Y")
			{
				hull()
				{
					cube([visibleAreaX,visibleAreaY,displayFudge]);
					translate([-bezelDepth,-bezelDepth,bezelDepth])
					cube([visibleAreaX+bezelDepth*2,visibleAreaY+bezelDepth*2,displayFudge*2]);
				}
			}
			else
			{
				cube([visibleAreaX,visibleAreaY,bezelDepth+displayFudge*2]);
			}
			//LDR
			translate([cydCutoutX/2-ldrX-ldrXoffset,cydCutoutY/2-ldrY-ldrYoffset,cydCutoutZ])
			cube([ldrX,ldrY,ldrZ]);
			if(ldrPinHole == "Y")
			{
				translate([cydCutoutX/2-ldrX/2-ldrXoffset,cydCutoutY/2-ldrY/2-ldrYoffset,cydCutoutZ])
				cylinder(d=ldrX/2,h=displayZ+bezelDepth+displayFudge);
			}
			//P1
			if(p1Cutout == "I" || p1Cutout == "E")
			{
				translate([-cydCutoutX/2-connectorY-p1Xoffset,-cydCutoutY/2+p1Yoffset,-displayFudge-enclosureFrontZ])
				cube([connectorY,connectorX,cydCutoutZ+enclosureFrontZ+displayFudge*2]);
				if(p1Cutout == "E")
				{
					translate([-enclosureX/2-cydCutoutX/2-connectorY-p1Xoffset,-cydCutoutY/2+p1Yoffset,cydCutoutZ-(p1Zoffset+connectorZ)])
					cube([connectorY+enclosureX/2,connectorX,connectorZ]);
				}
			}
			//P3
			if(p3Cutout == "I" || p3Cutout == "E")
			{
				translate([cydCutoutX/2-connectorX-p3Xoffset,cydCutoutY/2-p3Yoffset,-displayFudge-enclosureFrontZ])
				cube([connectorX,connectorY,cydCutoutZ+enclosureFrontZ+displayFudge*2]);
				if(p3Cutout == "E")
				{
					translate([cydCutoutX/2-connectorX-p3Xoffset,cydCutoutY/2-p3Yoffset,cydCutoutZ-(p3Zoffset+connectorZ)])
					cube([connectorX,connectorY+enclosureY/2,connectorZ]);
				}
			}
			//CN1
			if(cn1Cutout == "I" || cn1Cutout == "E")
			{
				translate([cydCutoutX/2-connectorX-cn1Xoffset,cydCutoutY/2-cn1Yoffset,-displayFudge-enclosureFrontZ])
				cube([connectorX,connectorY,cydCutoutZ+enclosureFrontZ+displayFudge*2]);
				if(cn1Cutout == "E")
				{
					translate([cydCutoutX/2-connectorX-cn1Xoffset,cydCutoutY/2-cn1Yoffset,cydCutoutZ-(cn1Zoffset+connectorZ)])
					cube([connectorX,connectorY+enclosureY/2,connectorZ]);
				}
			}
			//SD Card
			if(sdCardCutout == "I" || sdCardCutout == "E")
			{
				translate([cydCutoutX/2-sdCardX-sdCardXoffset,cydCutoutY/2-sdCardYoffset,-displayFudge-enclosureFrontZ])
				cube([sdCardX,sdCardY,cydCutoutZ+enclosureFrontZ+displayFudge*2]);
				if(sdCardCutout == "E")
				{
					translate([cydCutoutX/2-sdCardX-sdCardXoffset,cydCutoutY/2+sdCardY-sdCardYoffset-displayFudge,cydCutoutZ-(sdCardZoffset+sdCardZ)])
					{
						cube([sdCardX,sdCardY+enclosureY/2,sdCardZ]);
						hull()
						{
							translate([0,2,0])
							cube([sdCardX,sdCardY+enclosureY/2,sdCardZ]);
							translate([-2,5,0])
							cube([sdCardX+4,sdCardY+enclosureY/2,sdCardZ]);
						}
					}
				}
			}
			//USB
			if(usbCutout == "Y")
			{
				translate([-cydCutoutX/2-usbX1+displayFudge,cydCutoutY/2-usbY2-usbYoffset,cydCutoutZ-(usbZoffset+usbZ1+usbZ2)])
				hull()
				{
					translate([-2,-(usbY2-usbY1)/2,0])
					cube([usbX2+2,usbY2,usbZ2]);
					translate([-2,0,usbZ2])
					cube([usbX1+2,usbY1,usbZ1]);
				}
				translate([-cydCutoutX/2-usbX1-1.5-usbPlugX+displayFudge,cydCutoutY/2-usbPlugY-usbPlugYoffset,cydCutoutZ-(usbPlugZoffset+usbZ1+usbZ2)])
				//cube([usbPlugX,usbPlugY,usbPlugZ]);
				translate([0,0,usbPlugZ])
				rotate([0,90,0])
				roundedCornerCube(usbPlugZ,usbPlugY,usbPlugX,2);
			}
			//There always hs to be a little bit of USB cutout
			translate([-cydCutoutX/2-usbX1+displayFudge,cydCutoutY/2-usbY2-usbYoffset,cydCutoutZ-(usbZoffset+usbZ1+usbZ2)])
			hull()
			{
				translate([0,-(usbY2-usbY1)/2,-enclosureFrontZ])
				cube([usbX2,usbY2,usbZ2+enclosureFrontZ]);
				translate([0,0,usbZ2])
				cube([usbX1,usbY1,usbZ1]);
			}
		}
	}
}
//Creates a round corner cube at the origin
module roundedCornerCube(x,y,z,c)
{
    translate([c,c,0])
    hull()
    {
        cylinder(r=c,h=z);
        translate([x-c*2,0,0])
        cylinder(r=c,h=z);
        translate([x-c*2,y-c*2,0])
        cylinder(r=c,h=z);
        translate([0,y-c*2,0])
        cylinder(r=c,h=z);
    }
}