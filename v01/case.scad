/**
 * Martin Egli
 * 2026-11-09
 */
use <electronics.scad>
use <pcb.scad>

module ledpanel(loc_res = 32) {
    translate([51, 0, 0])
    rotate([0, 0, 90])
    neopixelpanel8x8(loc_res = loc_res);
    translate([52+67, 0, 0])
    rotate([0, 0, 90])
    neopixelpanel8x8(loc_res = loc_res);
    // mark the center
    *#translate([67-8.4, 0, -40])
    cube([0.01, 80, 80]);
}

// use m3_dia = 2.3 because using M3 thread cut -> bore is 2.3 mm
module ledpanel_cut(cut_len = 6, dia1 = 6, m3_len = 6, m3_dia = 2.4, loc_res = 32) {
    translate([51, 0, 0])
    rotate([0, 0, 90])
    neopixelpanel8x8_cut(len = cut_len, dia1 = dia1, m3len = m3_len, m3_dia = m3_dia, loc_res = loc_res);
    translate([52+67, 0, 0])
    rotate([0, 0, 90])
    neopixelpanel8x8_cut(len = cut_len, dia1 = dia1, m3len = m3_len, m3_dia = m3_dia, loc_res = loc_res);
    
    translate([-9.5, -9.5-2, -0])
    cube([138, 69+2, 3.1]);
    
}
*ledpanel_cut();

module ledpanel_face(cut_len = 6, dia1 = 6, m3_len = 6, loc_res = 32) {
    *ledpanel_cut(cut_len = cut_len, dia1 = dia1, m3_len = m3_len, loc_res = loc_res);
    
    translate([-9.5-2, -9.5-2, 3])
    cube([138+2*2, 69+2*2, cut_len-3+0.4]);
}
*ledpanel_face();

module button(hi = 6, loc_res = 32) {
    hull() {
        translate([-24/2, -8/2, 0])
        cube([24, 8, hi-2]);
        translate([-20/2, -12/2, 0])
        cube([20, 12, hi-2]);
        translate([-20/2, -8/2, 0])
        cube([20, 8, hi]);
    }
    hull() {
        translate([-26/2, -8/2, 0])
        cube([26, 8, 1]);
        translate([-20/2, -14/2, 0])
        cube([20, 14, 1]);
    }
}

module button_cut(hi = 6, loc_res = 32) {
    hull() {
        translate([-24.3/2, -8.3/2, 0])
        cube([24.3, 8.3, hi]);
        translate([-20.3/2, -12.3/2, 0])
        cube([20.3, 12.3, hi]);
    }
    hull() {
        translate([-26.3/2, -8.3/2, -hi])
        cube([26.3, 8.3, hi+1]);
        translate([-20.3/2, -14.3/2, -hi])
        cube([20.3, 14.3, hi+1]);
    }
}

module buttons(hi = 6, loc_res = 32) {
    translate([0, 0, 0])
    button(hi = hi, loc_res = loc_res);
    translate([-37.5, 0, 0])
    button(hi = hi, loc_res = loc_res);
    translate([+37.5, 0, 0])
    button(hi = hi, loc_res = loc_res);
}

// use m3_dia = 2.3 because using M3 thread cut -> bore is 2.3 mm
module buttons_cut(hi = 6, m3_len = 3, loc_res = 32) {
    translate([0, 0, 0])
    button_cut(hi = hi, loc_res = loc_res);
    translate([-37.5, 0, 0])
    button_cut(hi = hi, loc_res = loc_res);
    translate([+37.5, 0, 0])
    button_cut(hi = hi, loc_res = loc_res);
    
    // holes
    translate([+120/2, 0, -2])
    cylinder(d = 3.2, h = 2+m3_len, $fn = loc_res);
    translate([+37/2, 0, -2])
    cylinder(d = 3.2, h = 2+m3_len, $fn = loc_res);
    translate([-37/2, 0, -2])
    cylinder(d = 3.2, h = 2+m3_len, $fn = loc_res);
    translate([-120/2, 0, -2])
    cylinder(d = 3.2, h = 2+m3_len, $fn = loc_res);
    
    translate([+120/2, 0, 0.5])
    cylinder(d = 6.5, h = 2.5, $fn = 6);
    translate([+37/2, 0, 0.5])
    cylinder(d = 6.5, h = 2.5, $fn = 6);
    translate([-37/2, 0, 0.5])
    cylinder(d = 6.5, h = 2.5, $fn = 6);
    translate([-120/2, 0, 0.5])
    cylinder(d = 6.5, h = 2.5, $fn = 6);
}

module case01v100(show = 1, loc_res = 32) {
    difference() 
    {
        // case
        union() {
            // buttons
            translate([-4, 3, 79+2])
            cube([6, 12, 2]);
            translate([-4, 43.5, 79+2])
            cube([6, 14, 2]);
            translate([-4, 82, 79])
            cube([6, 12, 2]);
            translate([-4, 123, 79])
            cube([6, 12, 2]);
            
            hull() 
            {
                // buttons
                translate([0, -2, 76])
                cube([12, 138+2*2, 7.2]);
                
                translate([24, 9.5, 20.5])
                rotate([75, 0, 90])
                ledpanel_face();
                // bottom
                translate([0, -2, 10])
                cube([29+4.15, 138+2*2, 0.3]);
            
                // top
                translate([0, -4, 78.3])
                cube([12, 138+2*4, 3.0]);
                // button
                translate([0, -4, 10])
                cube([29+2.2, 138+2*4, 1]);
                
            }
        }    
        // inner cutout
        union() {
            // front panel
            translate([24, 9.5, 20.5])
            rotate([75, 0, 90])
            ledpanel_cut(m3_len = 6);
            hull() {
                // top
                translate([-1, -3, 76])
                cube([11.5+1, 138+2*3, 3.0]);
                // button
                translate([-1, -3, 10-1])
                cube([27+3.1, 138+2*3, 3.1+1]);
            }
            // cut half on top
            translate([-10, 0, 76+2.5])
            cube([9+9+1, 138/2, 2.5]);
            translate([-10, 138/2, 76+3+1.5])
            cube([9+9+1, 138/2, 2.5]);
            
            // buttons on top
            translate([0, 138/2, 80])
            rotate([0, 0, 90])
            buttons_cut();
            
            // sensor holes
            translate([6-2, 0, 30+23.5])
            rotate([90, -90, 0])
            cylinder(d = 2, h = 10, $fn = loc_res);
            translate([6-2, 0, 30+33.5])
            rotate([90, -90, 0])
            cylinder(d = 2, h = 10, $fn = loc_res);
        }
    }
    // M3 screws between case01 (top) and case 02 (bottom)
    difference() {
        union() {
            translate([00, 0.5, 10+1]) {
                cylinder(d = 6.5, h = 3, $fn = loc_res);
                translate([0, -3.6, 0])
                cube([6.5/2, 3.6, 3]);
            }
            translate([00, 137.5, 10+3+1]) {
                cylinder(d = 6.5, h = 3, $fn = loc_res);
                translate([0, 0, 0])
                cube([6.5/2, 3.6, 3]);
            }
            translate([20, 0.5, 10+1]) {
                cylinder(d = 6.5, h = 3, $fn = loc_res);
                translate([-6.5/2, -3.6, 0])
                cube([6.5, 3.6, 3]);
            }
            translate([20, 137.5, 10+1]) {
                cylinder(d = 6.5, h = 3, $fn = loc_res);
                translate([-6.5/2, 0, 0])
                cube([6.5, 3.6, 3]);
            }
        }
        // M3 cuts
        translate([00, 0.5, 10])
        cylinder(d = 3.2, h = 10, $fn = loc_res);
        translate([00, 137.5, 10])
        cylinder(d = 3.2, h = 10, $fn = loc_res);
        translate([20, 0.5, 10])
        cylinder(d = 3.2, h = 10, $fn = loc_res);
        translate([20, 137.5, 10])
        cylinder(d = 3.2, h = 10, $fn = loc_res);
    }
    
    if(show) {
        translate([24, 9.5, 20.5])
        rotate([75, 0, 90])
        ledpanel();
        
        translate([0, 138/2, 80])
        rotate([0, 0, 90])
        buttons();
        
        translate([0, 138/2, 80])
        translate([4, 0, -3])
        rotate([0, 0, 90])
        esp32c3_lighthouse_buttons();
        
        translate([6, 0, 30])
        rotate([90, -90, 0])
        esp32c3_lighthouse_sensors();
    }
}

module case02v100(show = 1, loc_res = 32) {
    difference() 
    {
        // case
        union() {
            
            hull() 
            {
                // top
                translate([-(29+4.15), -2, 9])
                cube([2*(29+4.15), 138+2*2, 1]);
                translate([-(29+2.2), -4, 9])
                cube([2*(29+2.2), 138+2*4, 1]);
                // botton
                translate([-23, -4, -3])
                cube([49, 138+2*4, 1]);
                translate([-25, -2, -3])
                cube([49+2+1, 138+2*2, 1]);
            }
            
            // notch to match top
            translate([-(27+3.1-2), -3, 10])
            cube([2*(27+3.1-2), 138+2*3, 0.8]);
        }    
        // inner cutout
        union() {
            hull() {
                translate([-(27+3.1+1), -2, 10-2])
                cube([2*(27+3.1+1), 138+2*2, 4]);
                translate([-23, -2, -2])
                cube([49, 138+2*2, 20]);
            }
        }
        // M3 screws between case01 (top) and case 02 (bottom)
        union() {
            // M3 cuts
            translate([-20, 0.5, -4]) {
                cylinder(d = 3.2, h = 10, $fn = loc_res);
                hull() {
                    cylinder(d = 3.2, h = 1+2, $fn = loc_res);
                    cylinder(d = 6.5, h = 1.2, $fn = loc_res);
                }
            }
            translate([-20, 137.5, -4]) {
                cylinder(d = 3.2, h = 10, $fn = loc_res);
                hull() {
                    cylinder(d = 3.2, h = 1+2, $fn = loc_res);
                    cylinder(d = 6.5, h = 1.2, $fn = loc_res);
                }
            }
            translate([00, 0.5, -4]) {
                cylinder(d = 3.2, h = 10, $fn = loc_res);
                hull() {
                    cylinder(d = 3.2, h = 1+2, $fn = loc_res);
                    cylinder(d = 6.5, h = 1.2, $fn = loc_res);
                }
            }
            translate([00, 137.5, -4]) {
                cylinder(d = 3.2, h = 10, $fn = loc_res);
                hull() {
                    cylinder(d = 3.2, h = 1+2, $fn = loc_res);
                    cylinder(d = 6.5, h = 1.2, $fn = loc_res);
                }
            }
            translate([20, 0.5, -4]) {
                cylinder(d = 3.2, h = 10, $fn = loc_res);
                hull() {
                    cylinder(d = 3.2, h = 1+2, $fn = loc_res);
                    cylinder(d = 6.5, h = 1.2, $fn = loc_res);
                }
            }
            translate([20, 137.5, -4]) {
                cylinder(d = 3.2, h = 10, $fn = loc_res);
                hull() {
                    cylinder(d = 3.2, h = 1+2, $fn = loc_res);
                    cylinder(d = 6.5, h = 1.2, $fn = loc_res);
                }
            }
        }
        // cut open USB-C
        hull() {
            translate([14, 74, 3.2+2])
            rotate([0, 90, 0])
            cylinder(d = 4.5, h = 20, $fn = loc_res);
            translate([14, 74-6, 3.2+2])
            rotate([0, 90, 0])
            cylinder(d = 4.5, h = 20, $fn = loc_res);
        }
        // cut open for micro sdcard
        translate([14, 40, 1.4+2])
        cube([20, 13, 2]);
        
        translate([26, (138+2*2)/2, -4])
        rotate([0, 0, 90])
        esp32c3_lighthouse_main_hole_cut();
        
        // cut bottom open
        for(n = [-6:1:7])
        translate([0, (138+2*2)/2-n*9, -6])
        hull() {
            translate([-20, 0, 0])
            cylinder(d = 2, h = 10, $fn = loc_res);
            translate([+23, 0, 0])
            cylinder(d = 2, h = 10, $fn = loc_res);
        }
    }
    
    
    if(show) {
        translate([26, (138+2*2)/2, -2])
        rotate([0, 0, 90])
        esp32c3_lighthouse_main();
    }
}
*case01v100(show = 0);
case02v100(show = 0);

*button(); // print 3 x
*case01v100(show = 0); // print 2 x
*case02v100(show = 0); // print 1 x