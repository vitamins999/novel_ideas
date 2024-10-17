function DestroyRubber(){
	global.rubberInstanceExists = false;
	global.controlled = CONTROL.PLAYER;
	instance_destroy();
}

function GetPlayerInputRubber(){
	keyLeft = input_check("left");
	keyRight = input_check("right");
	keyUp = input_check("up");
	keyDown = input_check("down");
}

function PlayerMovementRubber(){
	if (keyRight != 0) direction = 0;
	if (keyUp != 0) direction = 90;
	if (keyLeft != 0) direction = 180;
	if (keyDown != 0) direction = 270;
}