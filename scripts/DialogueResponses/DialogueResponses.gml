function DialogueResponses(response){
	/// @arg Response
	switch(response)
	{
		case 0: break;
		case 1:
		{
			// Warp to Christmas (change tilemap)
			ChangeScreenTiles("Tiles_2");
			with (obj_signpost)
			{
				image_speed = 1;
				oldCameraZone = "camera_main";
				newCameraZone = "camera_christmas";
				obj_player.moveToX = movePlayerToX;
				obj_player.moveToY = movePlayerToY;
				obj_player.movingWithoutPlayer = true;
			}
			 
			break;
		}
		case 2: NewTextBox("Well, now I'm very sad.", 2); break;
		default: break;
	}
}