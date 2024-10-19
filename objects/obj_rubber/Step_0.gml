if (!global.gamePaused)
{
	// Tilemap Collision
	/// Get New Tilemap
	if (tilemap_get_at_pixel(layer_tilemap_get_id(layer_get_id("Col")), x, y)) DestroyRubber();
	
	// Entity Collision
	var _entity = instance_place(x, y, p_entity);
	var _break = false;

	if (_entity != noone)
	{
		with (_entity)
		{
			if (object_is_ancestor(object_index, p_enemy))
			{
				HurtEnemy(id, 50, other.id, 20, "rubber");
				//_break = true;
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
	if (fadeSpeed == 2) sprite_index = spr_rubber_flash_faster;
	totalFrames = sprite_get_number(sprite_index) / 4;
	image_index = localFrame + (CARDINAL_DIR * totalFrames);
	
	if (fadeSpeed != 0) localFrame += sprite_get_speed(sprite_index) / FRAME_RATE;
	
	//instance_create_depth(floor(x), floor(y), depth, obj_rubber_dust); -- trigger every 16x16 square changing

	// Destroy if reaches end of animation
	if (localFrame >= totalFrames && fadeSpeed == 2)
	{
		DestroyRubber();
	}
	
	// Set Speed
	speed = 2;
	
	// Control Rubber
	GetPlayerInputRubber();
	PlayerMovementRubber();
}

if (global.gamePaused) speed = 0;