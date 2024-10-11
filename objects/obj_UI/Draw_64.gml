/// @description Draw Health
var _playerHealth = global.playerHealth;
var _playerHealthMax = global.playerHealthMax;

// Normal text
font_enable_effects(fnt_gui, true, {
	outlineEnable: true,
	outlineDistance: 1.5,
	outlineColour: c_blue
});
draw_set_font(fnt_gui);
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_text(5, 5, $"{_playerHealth}");

if (global.gamePaused)
{
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text(RESOLUTION_W, RESOLUTION_H, "PAUSED");
}

if (global.allowAttractMovement)
{
	draw_set_halign(fa_center);
	draw_set_valign(fa_bottom);
	draw_text(RESOLUTION_W, RESOLUTION_H * 2, "Attract Movement ON");
}
