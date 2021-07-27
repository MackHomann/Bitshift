/// @description
#region INFO
/*
 
*/
#endregion

#macro BITSHIFT 5
#macro CELLSIZE 1 << BITSHIFT
world = ds_grid_create(room_width >> BITSHIFT, room_height >> BITSHIFT);
ds_grid_clear(world, cell.air);		
enum cell {
	air,
	wall,
	water
}

cellName[cell.air]	= "Air";
cellName[cell.wall]	= "Wall";
cellName[cell.water]	= "Water";
lineAlpha = 1;

for (var i = 0; i < room_width >> BITSHIFT; ++i) {
    world[# i, (room_height >> BITSHIFT) - 1] = cell.wall
}