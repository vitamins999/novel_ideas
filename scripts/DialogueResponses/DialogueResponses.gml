function DialogueResponses(response){
	/// @arg Response
	switch(response)
	{
		case 0: break;
		case 1:
		{
			 // Warp to Christmas
			 global.warpX = obj_warp_main.x;
			 global.warpY = obj_warp_main.y;
			 global.warpToX = obj_warp_christmas.x;
			 global.warpToY = obj_warp_christmas.y;
			 
			 instance_create_depth(1, 1, -300, obj_warp_effect);
			 
			 break;
		}
		case 2: NewTextBox("Well, now I'm very sad.", 2); break;
		default: break;
	}
}