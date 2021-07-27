/// @description
#region INFO
/*
 
*/
#endregion
hspd = (keyboard_check_direct(vk_right) - keyboard_check_direct(vk_left)) * maxSpeed;
if (keyboard_check_pressed(vk_space) && onground) {
	vspd -= jumpSpd;
	onground = false;
}
vspd += grav;

var playerCurX1 = (playerX1) >> BITSHIFT;
var playerCurY1 = (playerY1) >> BITSHIFT;
var playerCurX2 = (playerX2) >> BITSHIFT;
var playerCurY2 = (playerY2) >> BITSHIFT;

var playerNewX1 = (playerX1 + ceil(hspd)) >> BITSHIFT;
var playerNewY1 = (playerY1 + ceil(vspd)) >> BITSHIFT; 
var playerNewX2 = (playerX2 + ceil(hspd)) >> BITSHIFT;
var playerNewY2 = (playerY2 + ceil(vspd)) >> BITSHIFT;

var _o = oLevel;        // _o is now shorthand for oLevel, makes it easier to type.
var _leftcheck1		= _o.world[# playerCurX1, playerCurY1]; // top left
var _leftcheck2		= _o.world[# playerCurX1, playerCurY2]; // bot left
var _leftcheckSpd1	= _o.world[# playerNewX1, playerCurY1]; // top left with speed
var _leftcheckSpd2	= _o.world[# playerNewX1, playerCurY2]; // bot left with speed

if (hspd < 0 ) {
	if ((check(_leftcheckSpd1) | check(_leftcheckSpd2)) & colCheckLeft != 0) {
		hspd = 0;
		playerX1 = (playerNewX1 + 1) << BITSHIFT;
		playerX2 = playerX1 + (playerWidth);
	} else {
		if ((check(_leftcheck1) | check(_leftcheck2)) & colCheckLeft != 0) {
			hspd = 0;
			playerX1 = (playerCurX1 + 1) << BITSHIFT;
			playerX2 = playerX1 + (playerWidth);
		} else {
			playerX1 += hspd;
			playerX2 += hspd;
		}
	}
}

var _rightcheck1	= _o.world[# playerCurX2, playerCurY1];
var _rightcheck2	= _o.world[# playerCurX2, playerCurY2];
var _rightcheckSpd1	= _o.world[# playerNewX2, playerCurY1];
var _rightcheckSpd2	= _o.world[# playerNewX2, playerCurY2];

if (hspd > 0 ) {
	if ((check(_rightcheckSpd1) | check(_rightcheckSpd2)) & colCheckRight != 0) {
		hspd = 0;
		playerX2 = ((playerNewX2) << BITSHIFT) - 1;
		playerX1 = playerX2 - (playerWidth);
	} else {
		if ((check(_rightcheck1) | check(_rightcheck2)) & colCheckRight != 0) {
			hspd = 0;
			playerX2 = ((playerCurX2) << BITSHIFT) - 1;
			playerX1 = playerX2 - (playerWidth);
		} else {
			playerX1 += hspd;
			playerX2 += hspd;
		}
	}	
}

var _upcheck1	= _o.world[# playerCurX1, playerCurY1]
var _upcheck2	= _o.world[# playerCurX2, playerCurY1]
var _upcheckSpd1	= _o.world[# playerCurX1, playerNewY1];
var _upcheckSpd2	= _o.world[# playerCurX2, playerNewY1];

if (vspd < 0 ) {
   if ((check(_upcheckSpd1) | check(_upcheckSpd2)) & colCheckUp = !0) {
		vspd = 0;
		playerY1 = (playerNewY1 + 1) << BITSHIFT;
		playerY2 = playerY1 + (playerHeight);
	} else {
		if ((check(_upcheck1) | check(_upcheck2)) & colCheckUp = !0) {
			vspd = 0;
			playerY1 = (playerCurY1 + 1) << BITSHIFT;
			playerY2 = playerY1 + (playerHeight);
		} else {
			playerY1 += vspd;
			playerY2 += vspd;
		}
	}
}

var _downcheck1		= _o.world[# playerCurX1, playerCurY2]
var _downcheck2		= _o.world[# playerCurX2, playerCurY2]
var _downcheckSpd1	= _o.world[# playerCurX1, playerNewY2]
var _downcheckSpd2	= _o.world[# playerCurX2, playerNewY2]

if (vspd > 0 ) {
   if ((check(_downcheckSpd1) | check(_downcheckSpd2)) & colCheckDown != 0) {
		vspd = 0;
		playerY2 = ((playerNewY1 + 1) << BITSHIFT) - 1;
		playerY1 = playerY2 - (playerHeight);
		onground = true;
	} else {
		if ((check(_downcheck1) | check(_downcheck2)) & colCheckDown = !0) {
			vspd = 0;
			playerY2 = ((playerCurY1 - 1) << BITSHIFT) - 1;
			playerY1 = playerY2 - (playerWidth);
			onground = true;
		} else {
			playerY1 += vspd;
			playerY2 += vspd;
		}
	}
}

x = mean(playerX1, playerX2);
y = mean(playerY1, playerY2);

