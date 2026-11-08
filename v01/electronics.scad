/**
 * Martin Egli
 * 2026-11-08
 */

module arrow(col = "Gold", th = 0.1, loc_res = 32) {
    color(col) {
        hull() {
            translate([0, 0, 0])
            cylinder(d = 1, h = th, $fn = loc_res);
            translate([-5, -8, 0])
            cylinder(d = 1, h = th, $fn = loc_res);
            translate([+5, -8, 0])
            cylinder(d = 1, h = th, $fn = loc_res);
        }
        hull() {
            translate([-2, -8, 0])
            cylinder(d = 1, h = th, $fn = loc_res);
            translate([+2, -8, 0])
            cylinder(d = 1, h = th, $fn = loc_res);
            translate([-2, -16, 0])
            cylinder(d = 1, h = th, $fn = loc_res);
            translate([+2, -16, 0])
            cylinder(d = 1, h = th, $fn = loc_res);
        }
    }
}

module led(col = "White", loc_res = 32) {
    color(col)
    translate([-5/2, -5/2, 0])
    cube([5, 5, 1.5]);
}

module buttonPTS526(col = "Silver", loc_res = 32) {
// origin in the middle, at the bottom
    color(col) {
        hull() {
            translate([-3/2, -4.8/2, 0])
            cube([3, 4.8, 1]);
            translate([-4.8/2, -3/2, 0])
            cube([4.8, 3, 1]);
        }
        translate([0, 0, 0])
        cylinder(d =2, h = 1.5, $fn = loc_res);
    }
}
*buttonPTS526();

module neopixelpanel8x8(col = "DarkGray", th = 1.6, loc_res = 32) {
    difference() {
        union() {
            color(col)
            translate([-(7+3./2), -(7+3./2), 0])
            cube([67, 68, th]);
            
            translate([50, 10, -0.1])
            arrow();
            translate([0, 55, -0.1])
            arrow();
            
            
            for(x = [0:1:7])
                for(y = [0:1:7])
                    translate([x*8.2-(6.6-5/2), y*8.5-(6.6-5/2), th])
                    led();
        }
        // this hole is origin
        translate([0, 0, -1])
        cylinder(d = 3, h = th+2, $fn = loc_res);
        translate([46.3+3, 0, -1])
        cylinder(d = 3, h = th+2, $fn = loc_res);
        translate([0, 22.5+3, -1])
        cylinder(d = 3, h = th+2, $fn = loc_res);
        translate([46.3+3, 22.5+3, -1])
        cylinder(d = 3, h = th+2, $fn = loc_res);
        translate([0, 48.0+3, -1])
        cylinder(d = 3, h = th+2, $fn = loc_res);
        translate([46.3+3, 48.0+3, -1])
        cylinder(d = 3, h = th+2, $fn = loc_res);
    }
}
*neopixelpanel8x8();

module esp32c3supermini(col = "DarkGray", th = 1.6, loc_res = 32) {
    difference() {
        union() {
            // PCB
            color(col)
            translate([-18/2, 0, 0])
            cube([18, 23, th]);
            // USB-C
            color("LightGray")
            translate([0, 7.5-1.5, th+3/2])
            rotate([90, 0, 0])
            hull() {
                translate([+(9-3)/2, 0, 0])
                cylinder(d= 3, h = 7.5, $fn = loc_res);
                translate([-(9-3)/2, 0, 0])
                cylinder(d= 3, h = 7.5, $fn = loc_res);
            }
            // pins
            for(n = [0:1:7]) {
                translate([+(15.2/2), n*2.54+1.5, -0.1])
                cylinder(d = 1.8, h = th + 0.2, $fn = loc_res);
                translate([-(15.2/2), n*2.54+1.5, -0.1])
                cylinder(d = 1.8, h = th + 0.2, $fn = loc_res);
            }
            // "headers"
            color("White")
            for(n = [0:1:7]) {
                translate([+(15.2/2)-2.54/2, n*2.54+1.5-2.54/2, -2.54])
                cube(2.54);
                translate([-(15.2/2)-2.54/2, n*2.54+1.5-2.54/2, -2.54])
                cube(2.54);
            }
        }
        // holes
        for(n = [0:1:7]) {
            translate([+(15.2/2), n*2.54+1.5, -0.2])
            cylinder(d = 1.0, h = th + 0.4, $fn = loc_res);
            translate([-(15.2/2), n*2.54+1.5, -0.2])
            cylinder(d = 1.0, h = th + 0.4, $fn = loc_res);
        }
    }
    
}
module dfplayer_mini(col = "DarkGray", th = 1.6, loc_res = 32) {
            // PCB
            color(col)
            translate([-21.2/2, 0, 0])
            cube([21.2, 20.55, th]);
            // usdcard
            color("LightGray")
            translate([-15.0/2, 0, th])
            cube([15.0, 15.5, th]);
            color("black")
            translate([-14.0/2, -3, th])
            cube([11.0, 15.5, 1]);
            // "headers"
            color("Black")
            for(n = [0:1:7]) {
                translate([+(7*2.54)/2-2.54/2, n*2.54+1.5-2.54/2, -2.54])
                cube(2.54);
                translate([-(7*2.54)/2-2.54/2, n*2.54+1.5-2.54/2, -2.54])
                cube(2.54);
            }
}
dfplayer_mini();