module camera(){
	translate([0,0,32.5]){
		cube([65,65,65],center=true);
	};
};
module cell(){
	translate([0,0,49.5]){
		//cube([18,26,1],center=true);
	};
	translate([0,6,45]){
		cylinder(3,4,4);
	};
	translate([0,-6,45]){
		cylinder(3,3,3);
	};
	translate([0,0,22.5]){
		cube([18,26,45],center=true);
	};
};
//cell();
module gem(size,cha){
	hull(){
		translate([cha,0,0]){cube(size,center=true);};
		translate([-cha,0,0]){cube(size,center=true);};
		translate([0,0,cha]){cube(size,center=true);};
		translate([0,0,-cha]){cube(size,center=true);};
		translate([0,cha,0]){cube(size,center=true);};
		translate([0,-cha,0]){cube(size,center=true);};
	};
};
/*
translate([0,0,0]){gem([10,10,10],5);}
translate([50,0,0]){gem([10,10,20],3);}
translate([-50,0,0]){gem([20,5,30],2);}
*/
t=1;
babyface=17;
module skull(t){
	difference(){
		union(){
			translate([0, 0,40]){gem([30-t,40-t,30-t],10-t);};
			translate([0,-9,20]){gem([25-t,30-t,25-t],5-t);};
		};
		union(){
			translate([ babyface,-25,38]){gem([10+t,10+t,10+t],5+t);};
			translate([-babyface,-25,38]){gem([10+t,10+t,10+t],5+t);};
		};
	};
};
module teeth(){
	translate([5,-25,5]){gem([5,5,5],2);};
	translate([14,-22,5]){gem([5,5,5],2);};
	translate([14,-12,5]){gem([5,5,5],2);};
	translate([14,-2,5]){gem([5,5,5],2);};
};
module teethL(){
	translate([4,-25,5]){gem([5,5,5],2);};
	translate([13,-22,5]){gem([5,5,5],2);};
	translate([13,-12,5]){gem([5,5,5],2);};
	translate([13,-2,5]){gem([5,5,5],2);};
};

module batteryBox(s,h){
	gem([18+s,26+s,51+s+h],2+s);
};

// mandibula inserts negative width
w=0.3;
m=1;
module hollowSkull(t){
	difference(){
		skull(0);
		union(){
			skull(t);
			translate([0,-9+5,5]){gem([25-t,30+(5*2)-t,30-t],5-t);};
			translate([0,14,5]){cube([33-t,3+(5*2)-t,30-t],center=true);};
// mandibula inserts negative
			translate([-17,12,8]){gem([2+w,5+w,41+w],5+w);};
			mirror(){translate([-17,12,8]){gem([2+w,5+w,41+w],5+w);};};
		};
	};
	difference(){
		union(){
			teeth();
			mirror(){teeth();};
		};
		union(){
			scale([1,1,3]){translate([0,-8,7]){gem([26,26+(4*2)-t,6],4);};};
		};
	};
// mandibula inserts positive
	difference(){
		union(){
			//pipe positives
			translate([-17,12,43]){gem([2+w+m,5+w+m,41+w+m],5+w+m);};
			mirror(){translate([-17,12,43]){gem([2+w+m,5+w+m,41+w+m],5+w+m);};};
			//contrafoces
			translate([0,25,57]){rotate([45]){cube([1,5,20],center=true);};};
			translate([-15,25,57]){rotate([45]){cube([1,5,20],center=true);};};
			mirror(){
				translate([-15,25,57]){rotate([45]){cube([1,5,20],center=true);};};
			};
		};
		union(){
			difference(){
				translate([0,0,50]){cube([90,90,90],center=true);}
				translate([0, 0,40]){gem([30-t,40-t,30-t],10-t);};
			};
			translate([-17,12,43]){gem([2+w,5+w,50+w],5+w);};
			mirror(){translate([-17,12,43]){gem([2+w,5+w,50+w],5+w);};};
			translate([0,1,10]){
				batteryBox(1,0);
			};
		};
	};
};
module mandibula(t){
	hull(){
		translate([0,-7,-10]){gem([25-t,30-t,5-t],5-t);};
		translate(			 [-17,12,-10]){gem([2-t,5-t,5-t],5-t);};
		mirror(){translate([-17,12,-10]){gem([2-t,5-t,5-t],5-t);};};
	};
	translate([-17,12,20]){gem([2-t,5-t,60-t],5-t);};
	mirror(){translate([-17,12,20]){gem([2-t,5-t,60-t],5-t);};};

};
module hollowMandibula(t){
	difference(){
		union(){
			difference(){
				union(){
					difference(){
						mandibula(0);
						mandibula(t);
					};
					difference(){
						translate([0,2,-9]){
							union(){
								teethL();
								mirror(){teethL();};
							};
						};
					};
				};
				union(){
					translate([0,-7,-5]){gem([25-(t*2),30-(t*2),10-(t*2)],5-(t*2));};
					translate([0,1,22.5]){
						gem([18,26,60],1);
					};
				};
			};
			difference(){
				translate([0,1,10]){
					batteryBox(0,0);
				};
				translate([0,1,22.5]){
					batteryBox(-1,50);
		
				};
			};
		};
		translate([0,0,97]){cube([100,100,100],center=true);}
	};
};

module testCase(){
	difference(){
		union(){
			color([1,1,.8]){hollowSkull(1);};
			hollowMandibula(1);
		};
		//translate([0,-50,-20]){cube(100,100,100);}
		//translate([0,-50,20]){cube(100,100,100);}
		//translate([-50,-50,10]){cube(100,100,100);}
		translate([-50,-90,-20]){cube(100,100,100);}
	};
};
//testCase();
//%translate([0,1,-5]){cell();};
//%translate([0,0]){camera();};
//%translate([0,0,-18]){camera();};//mandibula
//hollowMandibula(1);
rotate([180,0,0]){hollowSkull(1);}