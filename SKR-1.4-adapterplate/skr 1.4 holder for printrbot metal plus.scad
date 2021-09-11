$fn=180;

overlapright=5;
overlaptop=5;
overlapleft=5;
overlapbottom=5;

polewidth=8;
distance1to2=92.5;
distance2to3=54;
plateheight=5;
poleheight=20;
polehole=5;
hole1width=22;
hole1length=22;
holedistancefrom1=27;

boardhole=2.5;
boardpole=9;
boardheight=26;
boardbottomoffset=30;
boardleftoffset=8;
boardhorizontaldistance=76.3;
boardverticaldistance=101.85;

bottomoffset=38;
leftoffset=72;
topoffset=56;

totalheight=bottomoffset+overlapbottom+distance1to2+topoffset;
totalwidth=leftoffset+overlapright+distance2to3+overlapleft;

difference(){
    union(){
        //Plate
        translate([-leftoffset,-bottomoffset+20,-20])cube([totalwidth,totalheight-20,plateheight]);
        //Poles
        translate([overlapleft+distance2to3,overlapbottom,-20])cylinder(poleheight,polewidth/2,polewidth/2);
        translate([overlapleft,overlapbottom,-20])cylinder(poleheight,polewidth/2,polewidth/2);
        translate([overlapleft+distance2to3,overlapbottom+distance1to2,-20])cylinder(poleheight,polewidth/2,polewidth/2);
        translate([overlapleft+1,overlapbottom+distance1to2,-20])cylinder(poleheight,polewidth/2,polewidth/2); 
        //Board 
        translate([-leftoffset+boardleftoffset+boardhorizontaldistance,-bottomoffset+boardbottomoffset,-20])cylinder(boardheight,boardpole/2,boardpole/2);
        translate([-leftoffset+boardleftoffset,-bottomoffset+boardbottomoffset,-20])cylinder(boardheight,boardpole/2,boardpole/2);
        translate([-leftoffset+boardleftoffset,-bottomoffset+boardbottomoffset+boardverticaldistance,-20])cylinder(boardheight,boardpole/2,boardpole/2); 
    }
    //Poles Holes
    translate([overlapleft+distance2to3,overlapbottom,-1-20])cylinder(poleheight+2,polehole/2,polehole/2);
    translate([overlapleft,overlapbottom,-1-20])cylinder(poleheight+2,polehole/2,polehole/2);
    translate([overlapleft+distance2to3,overlapbottom+distance1to2,-1-20])cylinder(poleheight+2,polehole/2,polehole/2); 
    translate([overlapleft+1,overlapbottom+distance1to2,-1-20])cylinder(poleheight+2,polehole/2,polehole/2); 
    //Board Holes
    translate([-leftoffset+boardleftoffset+boardhorizontaldistance,-bottomoffset+boardbottomoffset,0.4-20])cylinder(boardheight+2,boardhole/2,boardhole/2);
    translate([-leftoffset+boardleftoffset,-bottomoffset+boardbottomoffset,0.4-20])cylinder(boardheight+2,boardhole/2,boardhole/2);
    translate([-leftoffset+boardleftoffset,-bottomoffset+boardbottomoffset+boardverticaldistance,0.4-20])cylinder(boardheight+2,boardhole/2,boardhole/2); 
    //shape
    translate([overlapleft+distance2to3+overlapright-hole1width,(overlapbottom+distance1to2-holedistancefrom1-hole1length),-1-20]) cube([hole1width+1,hole1length,plateheight+2]);
    #translate([-leftoffset-1,-bottomoffset+totalheight-54,-1-20]) cube([50,100,plateheight+2]);
    translate([-leftoffset+42,-bottomoffset+bottomoffset+70,-1-20]) cube([30,200,plateheight+2]);
    #translate([-leftoffset+leftoffset-1,-bottomoffset+bottomoffset+overlapbottom+distance1to2+overlaptop,-1-20]) cube([100,100,plateheight+2]);
}