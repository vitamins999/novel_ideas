if (instance_exists(obj_player))
{
	if (rectangle_in_rectangle(obj_player.bbox_left, obj_player.bbox_top, obj_player.bbox_right, obj_player.bbox_bottom, bbox_left, bbox_top, bbox_right, bbox_bottom) == 1)
	{
		global.camera_zone = id;
	}
}