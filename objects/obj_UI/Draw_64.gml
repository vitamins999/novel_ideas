/// @description Draw UI
var _playerHealth = global.playerHealth;
var _playerHealthMax = global.playerHealthMax;

// Normal text
// OLD OUTLINE CODE IN CASE WE NEED IT
//font_enable_effects(fnt_gui, true, {
	//outlineEnable: true,
	//outlineDistance: 1.5,
	//outlineColour: c_blue
//});
//DrawSetText(c_white, fnt_gui, fa_left, fa_top);
//draw_text(5, 5, $"{_playerHealth}");

DrawSetText(c_white, fnt_gui, fa_left, fa_top);
DrawTextOutline(5, 30, $"{_playerHealth}", 2,c_green,4,20,500);

if (global.gamePaused)
{
	DrawSetText(c_white, fnt_pause, fa_center, fa_middle);
	DrawTextOutline(RESOLUTION_W, RESOLUTION_H, "PAUSED",1,c_black,4,20,500)
	//draw_text(RESOLUTION_W, RESOLUTION_H, "PAUSED");
}

if (global.allowAttractMovement)
{
	DrawSetText(c_white, fnt_gui, fa_center, fa_bottom);
	draw_text(RESOLUTION_W, RESOLUTION_H * 2, "Attract Movement ON");
}

// Draw Item Box
_xx = 8;
_yy = RESOLUTION_H * 1.8;

draw_sprite(spr_item_ui_box, 0, _xx, _yy);
if (global.playerHasAnyItems)
{
	draw_sprite(spr_item_ui, global.playerEquipped, _xx, _yy);
	if (global.playerAmmo[global.playerEquipped] != -1)
	{
		draw_set_font(fnt_gui_item_ammo);
		draw_set_halign(fa_right);
		draw_set_valign(fa_bottom);
		draw_set_color(c_white);
		draw_text
		(
			_xx + sprite_get_width(spr_item_ui_box) - 1,
			_yy + sprite_get_height(spr_item_ui_box) + 1,
			string(global.playerAmmo[global.playerEquipped])
		)
	}
}

// Draw multi
if (global.playerPencilPowerMulti > 1)
{
	DrawSetText(c_white, fnt_gui, fa_left, fa_bottom);
	draw_text(5, RESOLUTION_H * 2, $"Pencil Power x {global.playerPencilPowerMulti}");
}