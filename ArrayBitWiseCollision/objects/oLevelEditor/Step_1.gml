/// @description
#region INFO
/*
 
*/
#endregion

var _mx = clamp(mouse_x >> BITSHIFT, 0, room_width >> BITSHIFT); // Bit shifting the mouse's x
var _my = clamp(mouse_y >> BITSHIFT, 0, room_width >> BITSHIFT); // bit shifting the mouse's y

if (mouse_check_button_pressed(mb_left)) {
	oLevel.world[# _mx, _my] = selected;
}

selected += mouse_wheel_down() - mouse_wheel_up()
selected = clamp(selected , 0, array_length_1d(oLevel.cellName) -1);