if (keyboard_check_pressed(ord("Z")) && !window_get_fullscreen())
{
	window_scale++;
	if (window_scale > max_window_scale)
	{
		window_scale = 1;
	}
	global.zoom_level = window_scale;
	window_set_size(view_width * window_scale, view_height * window_scale);
	surface_resize(application_surface, view_width * window_scale, view_height * window_scale);
	alarm[0] = 1;
}
