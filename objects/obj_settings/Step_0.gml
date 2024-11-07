if (mouse_check_button_pressed(mb_left))
{
	if (window_get_fullscreen())
	{
		window_set_fullscreen(false)
		global.zoom_level = temp_zoom_level;
	}
	else
	{
		temp_zoom_level = global.zoom_level;
		window_set_fullscreen(true)
		global.zoom_level = "Full Screen";
	}
}

if (keyboard_check_pressed(ord("Q")))
{
	game_end();
}

if (keyboard_check_pressed(ord("R")))
{
	game_restart();
}

if (keyboard_check_pressed(ord("M")))
{
	global.allowAttractMovement = !global.allowAttractMovement;
}

if (global.scoreCurrent < global.scoreMax) global.scoreCurrent += 2;