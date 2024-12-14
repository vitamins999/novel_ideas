function PlayerStateFree(){
	//Movement
	hSpeed = lengthdir_x(inputMagnitude * speedWalk, inputDirection);
	vSpeed = lengthdir_y(inputMagnitude * speedWalk, inputDirection);

	PlayerCollision();

	// Update Sprite Index
	var _oldSprite = sprite_index;

	if (inputMagnitude != 0)
	{
		direction = inputDirection;
		sprite_index = spriteRun;
	}
	else
	{
		sprite_index = spriteIdle;
	}

	if (_oldSprite != sprite_index)
	{
		localFrame = 0;
	}

	// Update Image Index
	PlayerAnimateSprite();
	
	//Activate Key for grab logic (NOTE: WILL NEED MORE IF PARAMETERS TO BE JUST PUSHABLE STUFF)
	// Also: this works where you can hold it down and approach, and we want it to be only possible if you're against it.
	if (keyActivate) && (direction mod 90 == 0)
	{
		var _grabX = x + lengthdir_x(3, direction);
		var _grabY = y + lengthdir_y(3, direction);
		grabbed = instance_position(_grabX, _grabY, p_pushable);
		if (grabbed != noone)
		{
			state = PlayerStatePush;
		}
	}
	
	if (keyActivatePressed) && (direction == 90)
	{
		// Check if warp signpost
		var _activateX = x + lengthdir_x(3, direction);
		var _activateY = y + lengthdir_y(3, direction);
		warpSignpost = instance_position(_activateX, _activateY, p_warp);
		if (warpSignpost != noone)
		{
			script_execute_ext(warpSignpost.entityActivateScript, warpSignpost.entityActivateArgs);
		}
	}
	
	if (keyActivatePressed)
	{
		// Check if NPC
		var _activateX = x + lengthdir_x(3, direction);
		var _activateY = y + lengthdir_y(3, direction);
		npc = instance_position(_activateX, _activateY, p_npc);
		
		if (npc != noone)
		{
			script_execute_ext(npc.entityActivateScript, npc.entityActivateArgs);
			
			with (npc)
			{
				direction = point_direction(x, y, other.x, other.y);
				image_index = CARDINAL_DIR;
			}
		}
	}

	//Attack Key Logic
	if (keyAttack)
	{
		state = PlayerStateAttack;
		stateAttack = AttackSlash;
	}
	
	//Item Key Logic Held Down
	if (keyItem) && (global.playerHasAnyItems) && (global.playerEquipped != ITEM.NONE)
	{
		switch (global.playerEquipped)
		{
			case ITEM.AFTERSHAVE: state = PlayerStateAttract; break;
			default: break;
		}
	}
	
	//Item Key Logic Pressed
	if (keyItemPressed) && (global.playerHasAnyItems) && (global.playerEquipped != ITEM.NONE)
	{
		switch (global.playerEquipped)
		{
			case ITEM.RUBBER: state = PlayerStateRubber; break;
			default: break;
		}
	}
	
	// Cycle Items
	if (global.playerHasAnyItems)
	{
		var _cycleDirection = keyItemSelectUp - keyItemSelectDown;
		if (_cycleDirection != 0)
		{
			do
			{
				global.playerEquipped += _cycleDirection;
				if (global.playerEquipped < 1) global.playerEquipped = ITEM.TYPE_COUNT - 1;
				if (global.playerEquipped >= ITEM.TYPE_COUNT) global.playerEquipped = 1;
			}
			until (global.playerItemUnlocked[global.playerEquipped]);
		}
	}
}