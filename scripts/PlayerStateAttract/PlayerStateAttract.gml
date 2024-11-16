function PlayerStateAttract(){
	// State for when using the aftershave.	
	if (sprite_index != spr_player_attract)
	{
		// Set up correct animation
		sprite_index = spr_player_attract;
		localFrame = 0;
		image_index = 0;
		global.attractBeingPressed = true;
	}
	
	//Movement
	if (global.allowAttractMovement)
	{
		hSpeed = lengthdir_x(inputMagnitude * speedWalk, inputDirection);
		vSpeed = lengthdir_y(inputMagnitude * speedWalk, inputDirection);

		PlayerCollision();
	}
	
	// Create aftershave puffs
	if (!aftershavePuffsActive)
	{
		aftershavePuffsActive = true;
		
		puff_1 = instance_create_layer(x - 10, y - 10, "Instances", obj_aftershave_puff);
		puff_2 = instance_create_layer(x + 10, y - 10, "Instances", obj_aftershave_puff);
		puff_3 = instance_create_layer(x - 10, y + 10, "Instances", obj_aftershave_puff);
		puff_4 = instance_create_layer(x + 10, y + 10, "Instances", obj_aftershave_puff);
	}
	
	if (input_check_released("special"))
	{
		global.attractBeingPressed = false;
		aftershavePuffsActive = false;
		instance_destroy(puff_1);
		instance_destroy(puff_2);
		instance_destroy(puff_3);
		instance_destroy(puff_4);
		sprite_index = spriteIdle;
		state = PlayerStateFree;
	}	
}