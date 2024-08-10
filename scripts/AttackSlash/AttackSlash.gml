function AttackSlash(){
	// Attack just started
	if (sprite_index != spr_player_attack_slash)
	{
		// Set up correct animation
		sprite_index = spr_player_attack_slash;
		localFrame = 0;
		image_index = 0;
		
		// Clear hit list
		if (!ds_exists(hitByAttack, ds_type_list))
		{
			hitByAttack = ds_list_create();
		}
		ds_list_clear(hitByAttack);
		
		
		
	}
	
	CalcAttack(spr_player_attack_slash_HB);
	
	// Update sprite
	PlayerAnimateSprite();
	
	if (animationEnd)
	{
		state = PlayerStateFree;
		animationEnd = false;
	}
}