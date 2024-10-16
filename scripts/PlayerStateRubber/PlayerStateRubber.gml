function PlayerStateRubber(){
	if (global.playerAmmo[ITEM.RUBBER] > 0 && !global.rubberInstanceExists)
	{
		global.playerAmmo[ITEM.RUBBER]--;
		global.rubberInstanceExists = true;
		
		with (instance_create_depth(floor(x), floor(y) - 7, depth, obj_rubber))
		{
			direction = other.direction;
			direction = CARDINAL_DIR * 90;
			image_speed = 0;
			image_index = CARDINAL_DIR;
			speed = 1;
		}
	}
	state = PlayerStateFree;
}