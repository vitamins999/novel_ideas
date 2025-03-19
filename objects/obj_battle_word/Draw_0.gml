scribbleObject = scribble(wordStr);
scribbleObject.starting_format("fnt_battle_sentence", c_black);

if (!invisible)
{
	scribbleObject.blend(c_red, 1);
}
else
{
	scribbleObject.blend(c_red, 0);
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