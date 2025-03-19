units = [];
turn = 0;
unitTurnOrder = [];
unitRenderOrder = [];
turnCount = 0;
roundCount = 0;
battleWaitTimeFrames = 30;
battleWaitTimeRemaining = 0;
battleText = "";
currentUser = noone;
currentAction = -1;
currentTargets = noone;
currentSentenceNumber = 0;

generateWordObjects = false;
wordInstanceIDArr = [];

populateEnemyWordsInstanceIDArray = false;
enemyWordsInstanceIDArr = [];

showOpeningEnemyMessage = true;
closeOpeningEnemyMessage = false;

showEndingEnemyMessage = true;
closeEndingEnemyMessage = false;

// Make targeting cursor
cursor = 
{
	activeUser: noone,
	activeTarget: noone,
	activeAction: -1,
	targetSide: -1,
	targetIndex: 0,
	targetAll: false,
	confirmDelay: 0,
	active: false
};

// Make party
for (var i = 0; i < array_length(global.party); i++)
{
	partyUnits[i] = instance_create_depth(x + 70 + (i * 10), y + 95 + (i * 15), depth - 10, obj_battle_unit_pc, global.party[i]);
	array_push(units, partyUnits[i]);
}

for (var i = 0; i < array_length(enemies); i++)
{
	enemyUnits[i] = instance_create_depth(x + 250 + (i * 10), y + 68 + (i * 20), depth - 10, obj_battle_unit_enemy, enemies[i]);
	array_push(units, enemyUnits[i]);
}

// Shuffle turn order?
//unitTurnOrder = array_shuffle(units);
unitTurnOrder = units;

// Get render order
RefreshRenderOrder = function()
{
	unitRenderOrder = [];
	array_copy(unitRenderOrder, 0, units, 0, array_length(units));
	array_sort(unitRenderOrder, function(_1, _2)
	{
		return _1.y - _2.y;
	});
};
RefreshRenderOrder();

function BattleStateSelectAction()
{
	if (!instance_exists(obj_battle_menu))
	{
		// Get Current Unit
		var _unit = unitTurnOrder[turn];	
	
		// Is the unit dead or unable to attack?
		if (!instance_exists(_unit)) || (_unit.hp <= 0)
		{
			battleState = BattleStateVictoryCheck;
			exit;
		}
	
		// Select an action to perform
		//BeginAction(_unit.id, global.actionLibrary.attack, _unit.id);
	
		// If unit is player controlled:
		if (_unit.object_index == obj_battle_unit_pc)
		{
			// Compile the action menu
			var _menuOptions = [];
			var _subMenus = {};
			
			var _actionList = _unit.actions;
			
			for (var i = 0; i < array_length(_actionList); i++)
			{
				var _action = _actionList[i];
				var _available = _action.available; // later we add mp cost here...
				var _nameAndCount = _action.name; // later we modify the name to include the item count , if the action is an item.
				if (_action.subMenu == -1)
				{
					array_push(_menuOptions, [_nameAndCount, MenuSelectAction, [_unit, _action], _available]);
				}
				else
				{
					// Create or add to a submenu
					if (is_undefined(_subMenus[$ _action.subMenu]))
					{
						variable_struct_set(_subMenus, _action.subMenu, [[_nameAndCount, MenuSelectAction, [_unit, _action], _available]]);
						
					}
					else
					{
						array_push(_subMenus[$ _action.subMenu], [_nameAndCount, MenuSelectAction, [_unit, _action], _available]);
					}
				}
			}
			
			// turn sub menus into an array
			var _subMenusArray = variable_struct_get_names(_subMenus);
			for (var i = 0; i < array_length(_subMenusArray); i++)
			{
				// Sort submenu if needed
				// (here)
					
				// Add back option at the end of the submenu
				array_push(_subMenus[$ _subMenusArray[i]], ["Back", MenuGoBack, -1, true]);
				// Add submenu into main menu
				array_push(_menuOptions, [_subMenusArray[i], SubMenu, [_subMenus[$ _subMenusArray[i]]], true]);
			}
			
			Menu(x + 10, y + 110, _menuOptions, , 90, 60);
		}
		else
		{
			// If unit is AI controlled:
			var _enemyAction = _unit.AIscript();
			if (_enemyAction != -1) BeginAction(_unit.id, _enemyAction[0], _enemyAction[1]);
		}
	}
}

function BeginAction(_user, _action, _targets)
{
	currentUser = _user;
	currentAction = _action;
	currentTargets = _targets;
	battleText = string_ext(_action.description, [_user.name]);
	if (!is_array(currentTargets)) currentTargets = [currentTargets];
	battleWaitTimeRemaining = battleWaitTimeFrames;
	with (_user)
	{
		acting = true;
		// Play user animation if it is defined for that action, and that user
		if (!is_undefined(_action[$ "userAnimation"])) && (!is_undefined(_user.sprites[$ _action.userAnimation]))
		{
			sprite_index = sprites[$ _action.userAnimation];
			image_index = 0;
		}
	}
	battleState = BattleStatePerformAction;
}

function BattleStatePerformAction()
{
	// If animation etc is still playing
	if (currentUser.acting)
	{
		// When it ends, perform action effect if it exists
		if (currentUser.image_index >= currentUser.image_number - 1)
		{
			with (currentUser)
			{
				sprite_index = sprites.idle;
				image_index = 0;
				acting = false;
			}
			
			if (variable_struct_exists(currentAction, "effectSprite"))
			{
				if (currentAction.effectOnTarget == MODE.ALWAYS) || ((currentAction.effectOnTarget == MODE.VARIES) && (array_length(currentTargets) <= 1))
				{
					for (var i = 0; i < array_length(currentTargets); i++)
					{
						instance_create_depth(currentTargets[i].x, currentTargets[i].y, currentTargets[i].depth, obj_battle_effect, {sprite_index: currentAction.effectSprite});
					}
				}
				else
				{
					// Play it at 0,0
					var _effectSprite = currentAction.effectSprite;
					if (variable_struct_exists(currentAction, "effectSpriteNoTarget")) _effectSprite = currentAction.effectSpriteNoTarget;
					instance_create_depth(x, y, depth - 100, obj_battle_effect, {sprite_index: _effectSprite});
				}
			}
			currentAction.func(currentUser, currentTargets);
		}
	}
	else // Wait for delay and then end the turn
	{
		if (!instance_exists(obj_battle_effect))
		{
			battleWaitTimeRemaining--;
			if (battleWaitTimeRemaining == 0)
			{
				battleState = BattleStateVictoryCheck;
			}
		}
	}
}

function BattleStateVictoryCheck()
{
	battleState = BattleStateTurnProgression;
}

function BattleStateTurnProgression()
{
	battleText = ""; // Reset battle text
	turnCount++;
	turn++;
	// Loop turns
	if (turn > array_length(unitTurnOrder) - 1)
	{
		turn = 0;
		roundCount++;
	}
	battleState = BattleStateSelectAction;
}

function BattleStateGenerateSentence()
{
	var _battleSentence = instance_create_depth(x + 45, y + 60, depth - 10, obj_battle_sentence,
		{
			textStr: enemySentencesArr[currentSentenceNumber]
		});
	
	textArr = CovertStringToFormattedArrayOfWords(enemySentencesArr[currentSentenceNumber]);
	
	for (var i = 0; i < array_length(textArr); i++)
	{
		var _word = instance_create_depth(_battleSentence.x + 10, _battleSentence.y + 5, _battleSentence.depth - 10, obj_battle_word, {wordStr: textArr[i]});
		array_push(wordInstanceIDArr, _word);
	}
	
	generateWordObjects = true;
	
	battleState = BattleStateSelectAction;
}

// Beginning Battle State
function BattleStateBeginBattle()
{
	if (input_check_pressed("activate") && !showOpeningEnemyMessage) closeOpeningEnemyMessage = true;
	
	// Enemy says something
	if (showOpeningEnemyMessage)
	{
		NewTextBox(openingEnemyMessage, 2)
		showOpeningEnemyMessage = false;
	}
	
	// Go to Generate Sentence State
	if (closeOpeningEnemyMessage) battleState = BattleStateGenerateSentence;
}

// Ending Battle State
function BattleStateEndBattle()
{
	if (input_check_pressed("activate") && !showEndingEnemyMessage) closeEndingEnemyMessage = true;
	
	// Enemy says something
	if (showEndingEnemyMessage)
	{
		NewTextBox(endingEnemyMessage, 2)
		showEndingEnemyMessage = false;
	}
	
	// End Battle
	if (closeEndingEnemyMessage)
	{
		instance_activate_object(obj_player);
		
		// Destroy Battle
		instance_destroy();
	}
}

battleState = BattleStateBeginBattle;