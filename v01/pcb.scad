/**
 * Martin Egli
 * 2026-11-08
 */
use <electronics.scad>

module esp32c3_lighthouse_main(col = "Green", th = 1.6, loc_res = 32) {
    translate([0, 0, th+2.54])
    esp32c3supermini(loc_res = loc_res);
    
    translate([-23, 0, th+2.54])
    dfplayer_mini();
    
    color(col)
    difference() {
        // PCB
        hull() {
            translate([+88/2, 1, 0])
            cylinder(r = 1, h = th, $fn = loc_res);
            translate([-88/2, 1, 0])
            cylinder(r = 1, h = th, $fn = loc_res);
            translate([+88/2, 1+21, 0])
            cylinder(r = 1, h = th, $fn = loc_res);
            translate([-88/2, 1+21, 0])
            cylinder(r = 1, h = th, $fn = loc_res);
        }
        // holes
        translate([+81/2, 2.5, -1])
        cylinder(r = 1.6, h = th+2, $fn = loc_res);
        translate([-81/2, 2.5, -1])
        cylinder(r = 1.6, h = th+2, $fn = loc_res);
        translate([+81/2, 2.5+18, -1])
        cylinder(r = 1.6, h = th+2, $fn = loc_res);
        translate([-81/2, 2.5+18, -1])
        cylinder(r = 1.6, h = th+2, $fn = loc_res);
    }    
}
*esp32c3_lighthouse_main();

module esp32c3_lighthouse_buttons(col = "Green", th = 1.6, loc_res = 32) {
    color(col)
    difference() {
        // PCB
        hull() {
            translate([+88/2, 1, 0])
            cylinder(r = 1, h = th, $fn = loc_res);
            translate([-88/2, 1, 0])
            cylinder(r = 1, h = th, $fn = loc_res);
            translate([+88/2, 1+6, 0])
            cylinder(r = 1, h = th, $fn = loc_res);
            translate([-88/2, 1+6, 0])
            cylinder(r = 1, h = th, $fn = loc_res);
        }
        // holes
        translate([+37/2, 4, -1])
        cylinder(r = 1.6, h = th+2, $fn = loc_res);
        translate([-37/2, 4, -1])
        cylinder(r = 1.6, h = th+2, $fn = loc_res);
    }
    translate([0, 4, th])
    buttonPTS526(loc_res = loc_res);
    translate([37, 4, th])
    buttonPTS526(loc_res = loc_res);
    translate([-37, 4, th])
    buttonPTS526(loc_res = loc_res);
}
*esp32c3_lighthouse_buttons();

module esp32c3_lighthouse_sensors(col = "Green", th = 1.6, loc_res = 32) {
    color(col)
    difference() {
        // PCB
        hull() {
            translate([+88/2, 1, 0])
            cylinder(r = 1, h = th, $fn = loc_res);
            translate([0, 1, 0])
            cylinder(r = 1, h = th, $fn = loc_res);
            translate([+88/2, 1+3, 0])
            cylinder(r = 1, h = th, $fn = loc_res);
            translate([0, 1+3, 0])
            cylinder(r = 1, h = th, $fn = loc_res);
        }
    }
    // lightsensor
    translate([23.5, 5/2, th])
    rotate([0, 0, 45])
    cylinder(r = 2, h = 1, $fn = 4);
    // rh-sensor
    translate([33.5, 5/2, th])
    rotate([0, 0, 45])
    cylinder(r = 2, h = 1, $fn = 4);
}
esp32c3_lighthouse_sensors();