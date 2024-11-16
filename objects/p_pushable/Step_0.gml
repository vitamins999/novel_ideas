if (InsideView(id))
{	
	arrowID.x = x;
	arrowID.y = y -15;
	insideView = true;
	
	if (distance_to_object(obj_player) < 10)
	{
		playerLocation = round(point_direction(x, y, obj_player.x, obj_player.y) / 90) mod 4;
		
		switch (playerLocation)
		{
			case 0: arrowID.sprite_index = spr_arrow_left_right; break;
			case 1: arrowID.sprite_index = spr_arrow_up_down; break;
			case 2: arrowID.sprite_index = spr_arrow_left_right; break;
			case 3: arrowID.sprite_index = spr_arrow_up_down; break;
		}
	}
	else
	{
		arrowID.sprite_index = -1;
	}
}
else
{
	insideView = false;
}