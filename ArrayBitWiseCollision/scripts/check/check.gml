///@description check(int);
///@argument block
function check(argument0) {
	var _check = 1;
	if (argument0 != 0 and argument0 != undefined) {
		return(_check << clamp(argument0 - 1, 0, 99));
	} else {return(0)}


}
