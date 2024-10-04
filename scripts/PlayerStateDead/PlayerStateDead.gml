function PlayerStateDead(){
	hSpeed = 0;
	vSpeed = 0;
	
	// if just arriving in this state
	if (sprite_index != spr_player_die) && (sprite_index != spr_player_dead)
	{
		// update sprite
		sprite_index = spr_player_die;
		image_index = 0;
		image_speed = 0.7;
	}
	
	// Animation ending this frame?
	if (image_index + image_speed > image_number)
	{
		if (sprite_index == spr_player_die) 
		{
			image_speed = max(0, image_speed - 0.03);
			if (image_speed < 0.07)
			{
				image_index = 0;
				sprite_index = spr_player_dead;
				image_speed = 1.0;
			}
		}
		else
		{
			image_speed = 0;
			image_index = image_number - 1;
			game_restart();
			//global.targetX = -1;
			//global.targetY = -1;
			//RoomTransition(TRANS_TYPE.SLIDE, rm_village);
		}
	}
}