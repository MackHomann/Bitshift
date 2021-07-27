/// @description
#region INFO
/*
 
*/
#endregion
playerWidth = 16;  // players hit box width
playerHeight = 28; // player hit box height

hspd = 0; // horizontal speed
vspd = 0; // vertical speed
maxSpeed = 2;
grav = 0.7;
jumpSpd = 9;
onground = true;

colCheckLeft		= check(cell.wall);
colCheckRight	= check(cell.wall);
colCheckUp		= check(cell.wall);
colCheckDown		= check(cell.wall);