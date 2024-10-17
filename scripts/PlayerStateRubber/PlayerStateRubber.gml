function PlayerStateRubber(){
	if (global.playerAmmo[ITEM.RUBBER] > 0 && !global.rubberInstanceExists)
	{
		global.playerAmmo[ITEM.RUBBER]--;
		
		with (instance_create_depth(floor(x), floor(y) - 7, depth, obj_rubber))
		{
			direction = other.direction;
			direction = CARDINAL_DIR * 90;
			global.controlled = CONTROL.RUBBER;
		}
	}
	state = PlayerStateFree;
}