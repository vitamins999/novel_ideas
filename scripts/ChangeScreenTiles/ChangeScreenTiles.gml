function ChangeScreenTiles(tilemapToMakeInvisible){
	var _cx = camera_get_view_x(VIEW_SCREEN);
	var _cxTo = _cx + camera_get_view_width(VIEW_SCREEN)
	var _cy = camera_get_view_y(VIEW_SCREEN);
	var _cyTo = _cy + camera_get_view_height(VIEW_SCREEN);
			
	var _tilemap_id = layer_tilemap_get_id(tilemapToMakeInvisible);
	var _timerProgess = 0;
	
	var _tilePositionsArray = [];
			
	for (var _i = _cx + 16; _i <= _cxTo; _i += 16)
	{
		for (var _j = _cy; _j <= _cyTo; _j += 16)
		{
			// puts in array
			array_push(_tilePositionsArray, [_i, _j]);
		}
	}
	
	// randomise array
	var _shuffledTilePositionsArray = array_shuffle(_tilePositionsArray);
	
	// tileTimer code HERE
	for (var _i = 0; _i < array_length(_tilePositionsArray); _i++)
	{
		var _tileTimer = instance_create_layer(0, 0, "Instances", obj_tile_timer);
		_tileTimer.tileX = _shuffledTilePositionsArray[_i][0];
		_tileTimer.tileY = _shuffledTilePositionsArray[_i][1];
		_tileTimer.tilemapId = _tilemap_id;
		_timerProgess += 1.5;
		_tileTimer.alarm[0] = _timerProgess;
		
		if (_i == array_length(_tilePositionsArray) - 1)
		{
			_tileTimer.lastInArray = true;
		}
	}
}