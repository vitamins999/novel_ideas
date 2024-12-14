lerpProgress += (1 - lerpProgress) / 50;
textProgress += global.textSpeed;

x1 = lerp(x1, x1Target, lerpProgress);
x2 = lerp(x2, x2Target, lerpProgress);

// Cycle through responses
keyUp = input_check_pressed("up");
keyDown = input_check_pressed("down");
responseSelected += (keyDown - keyUp);
var _max = array_length(responses) - 1;
var _min = 0;
if (responseSelected > _max) responseSelected = _min;
if (responseSelected < _min) responseSelected = _max;

// End message
if (input_check_pressed("activate"))
{
	var _messageLength = string_length(message);
	if (textProgress >= _messageLength)
	{
		if (responses[0] != -1)
		{
			with (originInstance)
			{
				DialogueResponses(other.responseScripts[other.responseSelected]);
			}
		}
		
		instance_destroy();
		if (instance_exists(obj_text_queued))
		{
			with (obj_text_queued)
			{
				ticket--;
			}
		}
		else
		{
			with (obj_player)
			{
				state = lastState;
			}
		}
	}
	else
	{
		if (textProgress > 2)
		{
			textProgress = _messageLength;
		}
	}
}