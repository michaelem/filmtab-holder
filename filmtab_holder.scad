use <roundedcube.scad>

width = 40;
height = 40;
depth = 20;
corner_radius = 1;
wall_thickness = 1;


module grippy_container(center_width, center_depth, center_heigth, inner_radius = 1, wall_thickness = 2) {
    outer_width = center_width + wall_thickness*2;
    outer_depth = center_depth + wall_thickness *2;
    outher_height = center_heigth + wall_thickness;
    outer_radius = inner_radius + wall_thickness;
    
    
    difference() {
        roundedcube([outer_width, outer_depth, outher_height], false, outer_radius, "z", $fn=60);

        
        translate([wall_thickness, wall_thickness, wall_thickness]) {
            roundedcube([center_width, center_depth, center_heigth + 1], false, inner_radius, "z", $fn=60);
        };
        
        
        translate([center_width/2 + wall_thickness, center_depth + wall_thickness*2 +1, center_heigth]) {
            rotate([90, 0, 0]) {
                cylinder(center_depth + wall_thickness * 2 + 2, 12, 12, $fn=240);
            }
        }
    }
}


translate([2, -(depth + wall_thickness * 2) / 2, 0]) {
    grippy_container(
        width,
        depth,
        height,
        corner_radius,
        wall_thickness
    );
}


outer_shell_width = width + wall_thickness * 2 + 0.1;
outer_shell_depth = depth + wall_thickness * 2 + 0.1;
outer_shell_height = height + wall_thickness;
outer_shell_corner_radius = corner_radius + wall_thickness + 0.05;

translate([-(outer_shell_width + wall_thickness * 2 + 2), -(outer_shell_depth + wall_thickness * 2) / 2, 0]) {    
    grippy_container(
        outer_shell_width,
        outer_shell_depth,
        outer_shell_height,
        outer_shell_corner_radius,
        wall_thickness
    );
}
