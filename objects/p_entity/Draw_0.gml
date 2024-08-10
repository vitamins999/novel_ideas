if (flash != 0)
{
	shader_set(sh_white_flash);
	shader_set_uniform_f(uFlash, flash);
}

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

if (shader_current() != -1)
{
	shader_reset();
}