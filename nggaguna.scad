$fn = 30;

module edge_cut_plate()
{
    import("edge-cut-plate.dxf");
}

module edge_cut_bottom()
{
    import("edge-cut-bottom.dxf");
}

module 2u()
{
    translate([ -19.05, 9.525 ]) import("2u.dxf");
}

module
m2_hole()
{
    circle(r = 1.1);
}

locations = [
    [ 51.5587, -42.6985, 0 ],
    [ 46.9252, -61.1825, 0 ],
    [ 102.3901, -55.3722, 0 ],
    [ 97.7566, -73.8562, 0 ],
    [ 79.2848, -88.8838, 0 ],
    [ 190.2777, -88.8839, 0 ],
    [ 171.8061, -73.8563, 0 ],
    [ 167.1975, -55.3722, 0 ],
    [ 222.6374, -61.1826, 0 ],
    [ 222.6499, -41.5463, 0 ]
];

module
switch_plate()
{
    difference()
    {
        edge_cut_plate();
        for (i = [0:len(locations) - 1])
            translate(locations[i]) m2_hole();
        translate([ 95.4646, -102.734518, 0 ]) rotate([ 0, 0, 166 ]) 2u();
        translate([ 95.4646, -102.734518, 0 ]) rotate([ 0, 0, 346 ]) 2u();
        translate([ 174.097865, -102.734592, 0 ]) rotate([ 0, 0, 194 ]) 2u();
        translate([ 174.097865, -102.734592, 0 ]) rotate([ 0, 0, 14 ]) 2u();
    }
}

module
bottom_plate()
{
    difference()
    {
        edge_cut_bottom();
        for (i = [0:len(locations) - 1])
            translate(locations[i]) m2_hole();
    }
}

translate([0, 0, 0]) switch_plate();
translate([0, 100, 0]) bottom_plate();