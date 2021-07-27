/// @description
#region INFO
/*
 
*/
#endregion
lineAlpha ^= keyboard_check_pressed(vk_tab);
draw_set_alpha(lineAlpha * 0.1);
for (var i = 0; i < room_width >> BITSHIFT; ++i) {
	draw_line(0 + (i * CELLSIZE), 0, 0 + (i * CELLSIZE), room_height);
}
for (var i = 0; i < room_height >> BITSHIFT; ++i) {
	draw_line(0, 0 + (i * CELLSIZE), room_width, 0 + (i * CELLSIZE));
}
draw_set_alpha(1);

for (var i = 0; i < room_width >> BITSHIFT; ++i) {
    for (var j = 0; j < room_height >> BITSHIFT; ++j) {
		switch (world[# i, j]) {
		    case cell.air:
		        // draw nothing here
		        break;
		    case cell.wall:
		        draw_rectangle(i * CELLSIZE, 
					(j * CELLSIZE), 
					((i + 1) * CELLSIZE) - 1, 
					((j + 1) * CELLSIZE) - 1, 
					(true));
		        break;
                    case cell.water:
		        draw_rectangle_colour(i * CELLSIZE, 
					(j * CELLSIZE), 
					((i + 1) * CELLSIZE) - 1, 
					((j + 1) * CELLSIZE) - 1, 
					c_blue, c_blue, c_blue, c_blue,
					(false));
		        break;
                    default:
		        // code here
		        break;
		}
	}
}