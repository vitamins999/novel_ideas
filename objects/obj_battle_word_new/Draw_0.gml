/// @description Insert description here
// You can write your code in this editor
scribbleObject = scribble(wordStrNew);

customColour = c_black;

if (owner == OWNER.PLAYER)
{
	customColour = #43d702;
}
else if (owner == OWNER.ENEMY)
{
	customColour = c_red;
}
else
{
	customColour = c_black;
}

scribbleObject.starting_format("fnt_battle_sentence", customColour);

if (!invisible)
{
	scribbleObject.blend(customColour, 1);
}
else
{
	scribbleObject.blend(customColour, 0);
}
	
scribbleObject.draw(x, y);

// Draw target cursor
if (instance_exists(obj_battle) && obj_battle.cursor.active)
{
	with (obj_battle.cursor)
	{
		if (activeTarget != noone)
		{
			if (!is_array(activeTarget))
			{
				draw_sprite(spr_pointer_words, 0, activeTarget.x, activeTarget.y);
			}
			else
			{
				draw_set_alpha(sin(get_timer() / 50000) + 1);
				for (var i = 0; i < array_length(activeTarget); i++)
				{
					draw_sprite(spr_pointer_words, 0, activeTarget[i].x, activeTarget[i].y);
				}
				draw_set_alpha(1.0);
			}
		}
	}
}