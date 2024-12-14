alpha = clamp(alpha + (fade * .01), 0, 1);
with (obj_player) state = PlayerStateLocked;

if (alpha == 1)
{
	global.isWarp = true;
	WarpTo(global.warpX, global.warpY, global.warpToX, global.warpToY);
	fade = -1;
}

if (alpha == 0) && (fade == -1)
{
	// Reset warps
	global.warpX = -1;
	global.warpY = -1;
	global.warpToX = -1;
	global.warpToY = -1;

	with (obj_player) state = PlayerStateFree;
	instance_destroy();
}

draw_set_color(c_white);
draw_set_alpha(alpha);
draw_rectangle(0, 0, RESOLUTION_W * 2, RESOLUTION_H * 2, 0);

//Reset opacity
draw_set_alpha(1);