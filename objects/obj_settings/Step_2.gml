/// @description Pause the Game
if (input_check_pressed("pause"))
{
	global.gamePaused = !global.gamePaused;
	
	if (global.gamePaused)
	{
		with (all)
		{
			gamePausedImageSpeed = image_speed;
			image_speed = 0;
		}
	}
	else
	{
		with (all)
		{
			image_speed = gamePausedImageSpeed;
		}
	}
}