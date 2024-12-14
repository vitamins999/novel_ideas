function WarpTo(_x, _y, _xTo, _yTo){
	var _relativeX = obj_player.x - _x;
	var _relativeY = obj_player.y - _y;
	
	obj_player.x = _xTo + _relativeX;
	obj_player.y = _yTo + _relativeY;
}