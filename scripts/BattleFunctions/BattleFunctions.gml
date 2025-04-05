function NewEncounter(_enemies, _enemySentencesArr, _openingEnemyMessage, _endingEnemyMessage, _endingEnemyMessageLose)
{
	for (var _i = 0; _i < array_length(_enemySentencesArr); _i++)
	{
		_enemySentencesArr[_i] = FormatTextWithLineBreaks(_enemySentencesArr[_i], 330);
	}
	
	
	instance_create_depth
	(
		camera_get_view_x(view_camera[0]),
		camera_get_view_y(view_camera[0]),
		-9999,
		obj_battle,
		{
			enemies: _enemies, 
			creator: id, 
			enemySentencesArr: _enemySentencesArr, 
			openingEnemyMessage: _openingEnemyMessage,
			endingEnemyMessage: _endingEnemyMessage,
			endingEnemyMessageLose: _endingEnemyMessageLose
		}
	)
}

function BattleChangeHP(_target, _amount, _AliveDeadOrEither = 0)
{
	// AliveDeadOrEither: 0 = alive only, 1 = dead only, 2 = any
	var _failed = false;
	if (_AliveDeadOrEither == 0) && (_target.hp <= 0) _failed = true;
	if (_AliveDeadOrEither == 1) && (_target.hp > 0) _failed = true;
	
	var _col = c_white;
	if (_amount > 0) _col = c_lime;
	
	var _text = _amount;

	if (_amount < 0) _text = _amount-_amount*2;
	
	if (_failed)
	{
		_col = c_white;
		_text = "failed";
	}
	instance_create_depth
	(
		_target.x,
		_target.y,
		_target.depth - 1,
		obj_battle_floating_text,
		{font: fnt_gui, col: _col, text: _text}
	);
	if (!_failed) _target.hp = clamp(_target.hp + _amount, 0, _target.hpMax);
}

function BattleWordInsert(_playerWord, _enemyWord)
{	
	// If word is underscores, then insert word in space.
	if (_enemyWord.owner == OWNER.BLANK)
	{
		var _wordInstanceIDArr = obj_battle.wordInstanceIDArr;
		var _newSentenceString = "";
		
		for (var _j = 0; _j < array_length(_wordInstanceIDArr); _j++)
		{
			if (_wordInstanceIDArr[_j] == _enemyWord)
			{
				var _newWordFormatted =  "^" + _playerWord.name;
				
				if (_j != 0) _newWordFormatted = string_lower(_newWordFormatted);
				
				_newSentenceString += _newWordFormatted;
			}
			else if (_wordInstanceIDArr[_j].wordStr != "\n")
			{
				_newSentenceString += _wordInstanceIDArr[_j].wordStr;	
			}
		}
		
		_newSentenceString = FormatTextWithLineBreaks(_newSentenceString, 330);
		
		for (var _j = 0; _j < array_length(_wordInstanceIDArr); _j++)
		{
			instance_destroy(_wordInstanceIDArr[_j]);
		}
		
		array_resize(obj_battle.wordInstanceIDArr, 0)
		array_resize(_wordInstanceIDArr, 0)
		
		var _textArr = CovertStringToFormattedArrayOfWords(_newSentenceString);
	
		for (var _j = 0; _j < array_length(_textArr);_j++)
		{
			var _owner = checkStringType(_textArr[_j]);
			
			var _word = instance_create_depth(obj_battle_sentence.x + 10, obj_battle_sentence.y + 5, obj_battle_sentence.depth - 10, obj_battle_word_new, {wordStr: _textArr[_j], owner: _owner, wordData: _playerWord});
			array_push(obj_battle.wordInstanceIDArr, _word);
		}
		
		global.lastWordRight = 0;
		global.lastWordTop = 0;
		
		obj_battle.generateWordObjects = true;
		
		return;
	}
	
	// If enemy word there, attack by with player word.
	if (_enemyWord.owner == OWNER.ENEMY)
	{
		var _strengthWeakness = global.type_grid[# _enemyWord.wordData.wordType, _playerWord.wordType];
		
		// Replace word
		var _wordInstanceIDArr = obj_battle.wordInstanceIDArr;
		var _newSentenceString = "";
		
		for (var _j = 0; _j < array_length(_wordInstanceIDArr); _j++)
		{
			if (_wordInstanceIDArr[_j] == _enemyWord)
			{
				var _newWordFormatted =  "^" + _playerWord.name;
				
				if (_j != 0) _newWordFormatted = string_lower(_newWordFormatted);
				
				_newSentenceString += _newWordFormatted;
			}
			else if (_wordInstanceIDArr[_j].wordStr != "\n")
			{
				_newSentenceString += _wordInstanceIDArr[_j].wordStr;	
			}
		}
		
		_newSentenceString = FormatTextWithLineBreaks(_newSentenceString, 330);
		
		for (var _j = 0; _j < array_length(_wordInstanceIDArr); _j++)
		{
			instance_destroy(_wordInstanceIDArr[_j]);
		}
		
		array_resize(obj_battle.wordInstanceIDArr, 0)
		array_resize(_wordInstanceIDArr, 0)
		
		var _textArr = CovertStringToFormattedArrayOfWords(_newSentenceString);
	
		for (var _j = 0; _j < array_length(_textArr);_j++)
		{
			var _owner = checkStringType(_textArr[_j]);
			
			var _word = instance_create_depth(obj_battle_sentence.x + 10, obj_battle_sentence.y + 5, obj_battle_sentence.depth - 10, obj_battle_word_new, {wordStr: _textArr[_j], owner: _owner, wordData: _playerWord});
			array_push(obj_battle.wordInstanceIDArr, _word);
		}
		
		global.lastWordRight = 0;
		global.lastWordTop = 0;
		
		obj_battle.generateWordObjects = true;
		
		return;
	}
	return;
}

function BattleWordInsertEnemy(_playerWord, _enemyWord)
{
	// If word is underscores, then insert word in space.
	if (_enemyWord.owner == OWNER.BLANK)
	{
		var _wordInstanceIDArr = obj_battle.wordInstanceIDArr;
		var _newSentenceString = "";
		
		for (var _j = 0; _j < array_length(_wordInstanceIDArr); _j++)
		{
			if (_wordInstanceIDArr[_j] == _enemyWord)
			{
				var _newWordFormatted =  "~" + _playerWord.name;
				
				if (_j != 0) _newWordFormatted = string_lower(_newWordFormatted);
				
				_newSentenceString += _newWordFormatted;
			}
			else if (_wordInstanceIDArr[_j].wordStr != "\n")
			{
				_newSentenceString += _wordInstanceIDArr[_j].wordStr;	
			}
		}
		
		_newSentenceString = FormatTextWithLineBreaks(_newSentenceString, 330);
		
		for (var _j = 0; _j < array_length(_wordInstanceIDArr); _j++)
		{
			instance_destroy(_wordInstanceIDArr[_j]);
		}
		
		array_resize(obj_battle.wordInstanceIDArr, 0)
		array_resize(_wordInstanceIDArr, 0)
		
		var _textArr = CovertStringToFormattedArrayOfWords(_newSentenceString);
	
		for (var _j = 0; _j < array_length(_textArr);_j++)
		{
			var _owner = checkStringType(_textArr[_j]);
			
			var _word = instance_create_depth(obj_battle_sentence.x + 10, obj_battle_sentence.y + 5, obj_battle_sentence.depth - 10, obj_battle_word_new, {wordStr: _textArr[_j], owner: _owner, wordData: _playerWord});
			array_push(obj_battle.wordInstanceIDArr, _word);
		}
		
		global.lastWordRight = 0;
		global.lastWordTop = 0;
		
		obj_battle.generateWordObjects = true;
		
		return;
	}
	
	// If enemy word there, attack by with player word.
	if (_enemyWord.owner == OWNER.PLAYER)
	{	
		// Replace word
		var _wordInstanceIDArr = obj_battle.wordInstanceIDArr;
		var _newSentenceString = "";
		
		for (var _j = 0; _j < array_length(_wordInstanceIDArr); _j++)
		{
			if (_wordInstanceIDArr[_j] == _enemyWord)
			{
				var _newWordFormatted =  "~" + _playerWord.name;
				
				if (_j != 0) _newWordFormatted = string_lower(_newWordFormatted);
				
				_newSentenceString += _newWordFormatted;
			}
			else if (_wordInstanceIDArr[_j].wordStr != "\n")
			{
				_newSentenceString += _wordInstanceIDArr[_j].wordStr;	
			}
		}
		
		_newSentenceString = FormatTextWithLineBreaks(_newSentenceString, 330);
		
		for (var _j = 0; _j < array_length(_wordInstanceIDArr); _j++)
		{
			instance_destroy(_wordInstanceIDArr[_j]);
		}
		
		array_resize(obj_battle.wordInstanceIDArr, 0)
		array_resize(_wordInstanceIDArr, 0)
		
		var _textArr = CovertStringToFormattedArrayOfWords(_newSentenceString);
	
		for (var _j = 0; _j < array_length(_textArr);_j++)
		{
			var _owner = checkStringType(_textArr[_j]);
			
			var _word = instance_create_depth(obj_battle_sentence.x + 10, obj_battle_sentence.y + 5, obj_battle_sentence.depth - 10, obj_battle_word_new, {wordStr: _textArr[_j], owner: _owner, wordData: _playerWord});
			array_push(obj_battle.wordInstanceIDArr, _word);
		}
		
		global.lastWordRight = 0;
		global.lastWordTop = 0;
		
		obj_battle.generateWordObjects = true;
		
		return;
	}
	return;
}