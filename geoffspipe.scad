// pipe
// **************************

top_dia      = 78;
top=45;
mid_dia = 73;
mid=125;
bot_dia  = 70;
bot=35;
bot_offset=10;
ring=4;
wall = 3;   
$fn=50;

 //top
       difference () {
       
       translate ([0,0,-top]) cylinder(h=top,r=top_dia/2+wall);
       translate ([0,0,-top]) cylinder(h=top,r=top_dia/2);
       }
 
 //bot
       difference () {
       
       union () {
       translate ([bot_offset,0,mid+5]) cylinder(h=5,r=bot_dia/2+ring); //ring
       translate ([bot_offset,0,mid]) cylinder(h=bot,r=bot_dia/2);
       }
       translate ([bot_offset,0,mid]) cylinder(h=bot,r=bot_dia/2-wall);
       }
 
 
 //middle

       difference () {
       
       hull () {
       translate ([0,0,0]) cylinder(h=5,r=top_dia/2+wall);
       translate ([bot_offset,0,mid]) cylinder(h=5,r=bot_dia/2+ring);
       }
       
       hull (){
       translate ([0,0,0]) cylinder(h=5,r=top_dia/2);
       translate ([bot_offset,0,mid]) cylinder(h=5,r=bot_dia/2-wall);
       }
       }
       
       
       difference () {
       }
   
   

   

