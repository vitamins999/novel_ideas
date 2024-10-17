/// @description Hit Things
var _entity = instance_place(x, y, p_entity);
var _break = false;

if (_entity != noone)
{
	with (_entity)
	{
		if (object_is_ancestor(object_index, p_enemy))
		{
			HurtEnemy(id, 50, other.id, 20);
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
		global.rubberInstanceExists = false;
		instance_destroy();
	}
}

// destroy if we leave the camera bounds
var _cam = view_camera[0];
var _camX = camera_get_view_x( _cam);
var _camY = camera_get_view_y( _cam);
if (!point_in_rectangle( x, y, _camX, _camY, _camX + camera_get_view_width(_cam), _camY + camera_get_view_height( _cam)))
{
	global.rubberInstanceExists = false;
	instance_destroy();
}

// Update Sprite
totalFrames = sprite_get_number(sprite_index) / 4;
image_index = localFrame + (CARDINAL_DIR * totalFrames);
localFrame += sprite_get_speed(sprite_index) / FRAME_RATE;

// Destroy if reaches end of animation
if (localFrame >= totalFrames)
{
	global.rubberInstanceExists = false;
	instance_destroy();
}