/// @description Draw Health
var _playerHealth = global.playerHealth;
var _playerHealthMax = global.playerHealthMax;

// Normal text
font_enable_effects(fnt_gui, true, {
	outlineEnable: true,
	outlineDistance: 1.5,
	outlineColour: c_blue
});
DrawSetText(c_white, fnt_gui, fa_left, fa_top);
draw_text(5, 5, $"{_playerHealth}");

if (global.gamePaused)
{
	DrawSetText(c_white, fnt_gui, fa_center, fa_middle);
	draw_text(RESOLUTION_W, RESOLUTION_H, "PAUSED");
}

if (global.allowAttractMovement)
{
	DrawSetText(c_white, fnt_gui, fa_center, fa_bottom);
	draw_text(RESOLUTION_W, RESOLUTION_H * 2, "Attract Movement ON");
}
