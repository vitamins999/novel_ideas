// Run state machine
battleState();

// Cursor control
if (cursor.active && array_length(enemyWordsInstanceIDArr) > 0)
{
	with (cursor)
	{
		// Input (replace with bindings for Input Library!!)
		var _keyUp = input_check_pressed("up")
		var _keyDown = input_check_pressed("down");
		var _keyLeft = input_check_pressed("left");
		var _keyRight = input_check_pressed("right");
		confirmDelay++;
		if (confirmDelay > 1)
		{
			_keyConfirm = input_check_pressed("activate");
			_keyCancel = input_check_pressed("cancel");
			_keyToggle = input_check_pressed("special");
		}
		var _moveH = _keyRight - _keyLeft;
		var _moveV = _keyDown - _keyUp;
		
		if (_moveH == -1) targetSide = obj_battle.partyUnits;
		//if (_moveH == 1) targetSide = obj_battle.enemyUnits;
		if (_moveH == 1) targetSide = obj_battle.enemyWordsInstanceIDArr;
		
		// Verify target list (so dead enemies can't be targeted)
		//if (targetSide == obj_battle.enemyUnits)
		//{
		//	targetSide = array_filter(targetSide, function(_element, _index)
		//	{
		//		return _element.hp > 0;
		//	});
		//}
		
		// Move between targets
		if (targetAll == false) // Single target mode
		{
			if (_moveV == 1) targetIndex++;
			if (_moveV == -1) targetIndex--;
			
			// Wrap
			var _targets = array_length(targetSide);
			if (targetIndex < 0) targetIndex = _targets -1;
			if (targetIndex > (_targets - 1)) targetIndex = 0;
			
			// Identify target
			activeTarget = targetSide[targetIndex];
			
			// Toggle all mode
			if (activeAction.targetAll == MODE.VARIES) && (input_check_pressed("special")) // Switch to all mode
			{
				targetAll = true;
			}
		}
		else // Target all mode
		{
			activeTarget = targetSide;
			if (activeAction.targetAll == MODE.VARIES) && (input_check_pressed("special")) // Switch to single mode
			{
				targetAll = false;
			}
		}
		
		// Confirm action
		if (input_check_pressed("activate")) && (obj_battle.cursor.confirmDelay > 1)
		{
			with (obj_battle) BeginAction(cursor.activeUser, cursor.activeAction, cursor.activeTarget);
			with (obj_battle_menu) instance_destroy();
			active = false;
			confirmDelay = 0;
		}
		
		// Cancel and return to menu
		if (input_check_pressed("cancel")) && (!input_check_pressed("activate"))
		{
			with (obj_battle_menu) active = true;
			active = false;
			confirmDelay = 0;
		}
	}
}

// Generate the seperate word object instances and get their IDs
if (generateWordObjects)
{
	for (var i = 0; i < array_length(wordInstanceIDArr); i++)
	{
		wordInstanceIDArr[i].x += global.lastWordRight;
		wordInstanceIDArr[i].y += global.lastWordTop;
		
		if (wordInstanceIDArr[i].wordStr == "\n")
		{
			global.lastWordRight = -5;
			global.lastWordTop += 15;
		}
		else
		{
			global.lastWordRight += wordInstanceIDArr[i].scribbleObject.get_right();
		}
	}
	
	generateWordObjects = false;
	populateEnemyWordsInstanceIDArray = true;
}

// Populate enemy words ID array
if (populateEnemyWordsInstanceIDArray)
{
	if (array_length(enemyWordsInstanceIDArr) > 0)
	{
		array_resize(enemyWordsInstanceIDArr, 0);
	}
	
	for (var i = 0; i < array_length(enemyWordsInSentencesArr[currentSentenceNumber]); i++)
	{
		for (var j = 0; j < array_length(wordInstanceIDArr); j++)
		{
			if (string_lower(enemyWordsInSentencesArr[currentSentenceNumber][i]) == string_lower(wordInstanceIDArr[j].wordStr))
			{
				// Loop through remaining words in sentence and add their IDs
				// to an array in the THIS word
				for (var k = j + 1; k < array_length(wordInstanceIDArr); k++)
				{
					if (k == array_length(wordInstanceIDArr)) break;
					
					array_push(wordInstanceIDArr[j].remainingWordsInSentence, wordInstanceIDArr[k]);
				}
				
				array_push(enemyWordsInstanceIDArr, wordInstanceIDArr[j]);
				
			}
		}
	}
	
	populateEnemyWordsInstanceIDArray = false;
}