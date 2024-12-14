function NewTextBox(){
	/// @arg Message
	/// @arg Background
	/// @arg [Responses]
	
	var _obj;
	
	if (instance_exists(obj_text))
	{
		_obj = obj_text_queued
	}
	else
	{
		_obj = obj_text;
	}
	
	with (instance_create_layer(0, 0, "Instances", _obj))
	{
		message = argument[0];
		if (instance_exists(other))
		{
			originInstance = other.id
		}
		else
		{
			originInstance = noone;
		}
		
		if (argument_count > 1)
		{
			background = argument[1];
		}
		else
		{
			background = 1;
		}
		
		if (argument_count > 2)
		{
			// Trim markers from response
			var _array = argument[2];
			
			for (var _i = 0; _i < array_length(_array); _i++)
			{
				responses[_i] = _array[_i];
			}
			
			for (var i = 0; i < array_length(responses); i++)
			{
				var _markerPosition = string_pos(":", responses[i]);
				responseScripts[i] = string_copy(responses[i], 1, _markerPosition - 1);
				responseScripts[i] = real(responseScripts[i]);
				responses[i] = string_delete(responses[i], 1, _markerPosition);
			}
		}
		else
		{
			responses = [-1];
			responseScripts = [-1];
		}
	}
	
	with (obj_player)
	{
		if (state != PlayerStateLocked)
		{
			lastState = state;
			state = PlayerStateLocked;
		}
	}
}