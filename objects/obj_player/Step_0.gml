//Get Player Input

keyLeft = input_check("left");
keyRight = input_check("right");
keyUp = input_check("up");
keyDown = input_check("down");
keyActivate = input_check("activate");
keyActivatePressed = input_check_pressed("activate");
keyAttack = input_check_pressed("attack");
keyItem = input_check("special");
keyItemSelectUp = input_check_pressed("weapon_cycle_up");
keyItemSelectDown = input_check_pressed("weapon_cycle_down");

inputDirection = point_direction(0, 0, keyRight - keyLeft, keyDown - keyUp);
inputMagnitude = (keyLeft - keyRight != 0) || (keyDown - keyUp != 0);

if (!global.gamePaused && global.controlled = CONTROL.PLAYER)
{
	script_execute(state);	
	invulnerable = max(invulnerable - 1, 0);
	flash = max(flash - 0.05, 0);
}

depth = -bbox_bottom;