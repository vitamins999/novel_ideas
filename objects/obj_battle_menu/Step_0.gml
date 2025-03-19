if (active)
{
	// Control menu with keyboard (rework with Juju Adams Input Library!!!)
	hover += input_check_pressed("down") - input_check_pressed("up");
	if (hover > array_length(options) - 1) hover = 0;
	if (hover < 0) hover = array_length(options) - 1;
	
	// Execute selected option
	if (input_check_pressed("activate"))
	{
		if (array_length(options[hover]) > 1) && (options[hover][3] == true)
		{
			if (options[hover][1] != -1)
			{
				var _func = options[hover][1];
				if (options[hover][2] != -1) script_execute_ext(_func, options[hover][2]); else _func();
			}
		}
	}
	
	if (input_check_pressed("cancel"))
	{
		if (subMenuLevel > 0) MenuGoBack();
	}
}