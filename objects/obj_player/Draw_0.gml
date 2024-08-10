// Draw shadow.  Looks shit on square arrows placeholder sprite.  Put back in for Stu.
//draw_sprite(spr_shadow, 0, floor(x), floor(y));

draw_sprite_ext(
	sprite_index,
	image_index,
	floor(x),
	floor(y - z),
	image_xscale,
	image_yscale,
	image_angle,
	image_blend,
	image_alpha
);