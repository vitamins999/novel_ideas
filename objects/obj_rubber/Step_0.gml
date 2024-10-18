if (!global.gamePaused)
{
	var _entity = instance_place(x, y, p_entity);
	var _break = false;

	if (_entity != noone)
	{
		with (_entity)
		{
			if (object_is_ancestor(object_index, p_enemy))
			{
				//HurtEnemy(id, 50, other.id, 20);
				instance_destroy(id);
				_break = true;
			}
			else
			{
				if (entityHitScript != -1)
				{
					script_execute(entityHitScript);
					_break = true;
				}
			}
		}
		if (_break)
		{
			DestroyRubber();
		}
	}

	// destroy if we leave the camera bounds
	var _cam = view_camera[0];
	var _camX = camera_get_view_x( _cam);
	var _camY = camera_get_view_y( _cam);
	if (!point_in_rectangle( x, y, _camX, _camY, _camX + camera_get_view_width(_cam), _camY + camera_get_view_height( _cam)))
	{
		DestroyRubber();
	}

	// Update Sprite
	totalFrames = sprite_get_number(sprite_index) / 4;
	image_index = localFrame + (CARDINAL_DIR * totalFrames);
	//localFrame += sprite_get_speed(sprite_index) / FRAME_RATE;
	
	//instance_create_depth(floor(x), floor(y), depth, obj_rubber_dust); -- trigger every 16x16 square changing

	// Destroy if reaches end of animation
	//if (localFrame >= totalFrames)
	//{
	//	DestroyRubber();
	//}
	
	// Set Speed
	speed = 2;
	
	// Control Rubber
	GetPlayerInputRubber();
	PlayerMovementRubber();
}

if (global.gamePaused) speed = 0;