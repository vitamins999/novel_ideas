// Action Library

global.actionLibrary = 
{
	/*dictionary:
	{
		name: "Dictionary",
		description: "{0} used Dictionary!",
		subMenu: -1,
		targetRequired: true,
		targetEnemyByDefault: true,
		targetAll: MODE.NEVER,
		userAnimation: "attack",
		effectSprite: spr_attack_bonk,
		effectOnTarget: MODE.ALWAYS,
		func: function(_user, _targets)
		{
			show_debug_message("Dictionary was used!");
			var _damage = ceil(_user.strength + random_range(-_user.strength * 0.25, _user.strength * 0.25));
			BattleChangeHP(_targets[0], -_damage, 0);
		}
	},*/
	
	aftershave: 
	{
		name: "Aftershave",
		description: "{0} used aftershave!",
		subMenu: "Items",
		targetRequired: true,
		targetEnemyByDefault: true,
		targetAll: MODE.NEVER,
		userAnimation: "attack",
		//effectSprite: "",
		effectOnTarget: MODE.ALWAYS,
		available: true,
		func: function()
		{
			show_debug_message("Aftershave was used!");
		}
	},
	
	rubber: 
	{
		name: "Rubber",
		description: "{0} used rubber!",
		subMenu: "Items",
		targetRequired: true,
		targetEnemyByDefault: true,
		targetAll: MODE.NEVER,
		userAnimation: "attack",
		//effectSprite: "",
		effectOnTarget: MODE.ALWAYS,
		available: true,
		func: function()
		{
			show_debug_message("Rubber was used!");
		}
	},
	
	thing: 
	{
		name: "Thing",
		description: "{0} used something thing!",
		subMenu: "Items",
		targetRequired: true,
		targetEnemyByDefault: true,
		targetAll: MODE.NEVER,
		userAnimation: "attack",
		//effectSprite: "",
		effectOnTarget: MODE.ALWAYS,
		available: true,
		func: function()
		{
			show_debug_message("Thing was used!");
		}
	},
	// Words
	
	
}

enum MODE
{
	NEVER = 0,
	ALWAYS = 1,
	VARIES = 2
}

// Party Data
global.party = 
[
	{
		name: "Stu",
		isPlayerControlled: true,
		hp: 100,
		hpMax: 100,
		strength: 6,
		sprites: {idle: spr_player_battle, attack: spr_player_attack_slash, down: spr_player_dead},
		actions: []
	}		
]

global.enemyWords = 
{
	hedge:
	{
		name: "Hedge",
		hp: 100,
		description: "{0} used Hedge!",
		subMenu: "Dictionary",
		targetRequired: true,
		targetEnemyByDefault: true,
		targetAll: MODE.NEVER,
		userAnimation: "attack",
		effectSprite: spr_attack_bonk,
		effectOnTarget: MODE.ALWAYS,
		wordType: TYPE.GRASS,
		obtained: true,
		available: true,
		func: function(_user, _targets)
		{
			BattleWordInsertEnemy(global.enemyWords.hedge, _targets[0]);
			global.enemyWords.hedge.available = false;
		}
	},
	
	campfire:
	{
		name: "Campfire",
		hp: 100,
		description: "{0} used Campfire!",
		subMenu: "Dictionary",
		targetRequired: true,
		targetEnemyByDefault: true,
		targetAll: MODE.NEVER,
		userAnimation: "attack",
		effectSprite: spr_attack_bonk,
		effectOnTarget: MODE.ALWAYS,
		wordType: TYPE.FIRE,
		obtained: true,
		available: true,
		func: function(_user, _targets)
		{
			BattleWordInsertEnemy(global.enemyWords.campfire, _targets[0]);
			global.enemyWords.campfire.available = false;
		}
	},
	
	pond:
	{
		name: "Pond",
		hp: 100,
		description: "{0} used Pond!",
		subMenu: "Dictionary",
		targetRequired: true,
		targetEnemyByDefault: true,
		targetAll: MODE.NEVER,
		userAnimation: "attack",
		effectSprite: spr_attack_bonk,
		effectOnTarget: MODE.ALWAYS,
		wordType: TYPE.WATER,
		obtained: true,
		available: true,
		func: function(_user, _targets)
		{
			BattleWordInsertEnemy(global.enemyWords.pond, _targets[0]);
			global.enemyWords.pond.available = false;
		}
	}
}

global.enemyActions =
{
	noWords:
	{
		name: "No Words",
		hp: 0,
		description: "{0} has run out of words!",
		subMenu: "Dictionary",
		targetRequired: true,
		targetEnemyByDefault: true,
		targetAll: MODE.NEVER,
		userAnimation: "attack",
		effectSprite: spr_attack_bonk,
		effectOnTarget: MODE.ALWAYS,
		wordType: TYPE.NORMAL,
		obtained: true,
		available: true,
		func: function(_user, _targets)
		{
			show_debug_message("No words!");
		}
	}
}

// Enemy Data
global.enemies = 
{
	loveTriangle:
	{
		name: "Love Triangle",
		isPlayerControlled: false,
		hp: 10,
		hpMax: 10,
		sprites: {idle: spr_love_triangle},
		actions: [global.enemyWords.hedge, global.enemyWords.campfire, global.enemyWords.pond],
		AIscript: function()
		{
			var _action = -1;
			var _possibleTargets;
			var _target;
			
			var _availableActions = [];
			
			for (var _l = 0; _l < array_length(actions); _l++)
			{
				if (actions[_l].available == true) array_push(_availableActions, actions[_l]);
			}
			
			// If enemy has used up all its move, then it does NOTHING.
			if (array_length(_availableActions) <= 0)
			{
				_action = global.enemyActions.noWords;
				_possibleTargets = obj_battle.playerWordsInstanceIDArr;
				_target = _possibleTargets[irandom(array_length(_possibleTargets) - 1)];
			}
			
			// Otherwise...
			// Put random enemy word in a random available blank space if it exists
			if (array_length(obj_battle.blankWordsInstanceIDArr) > 0)
			{
				_possibleTargets = obj_battle.blankWordsInstanceIDArr;
				_target = _possibleTargets[irandom(array_length(_possibleTargets) - 1)];
				
				_action = _availableActions[irandom(array_length(_availableActions) - 1)];
			}
			else
			{
				_possibleTargets = obj_battle.playerWordsInstanceIDArr;
				
				for (var _p = 0; _p < array_length(_possibleTargets); _p++)
				{
					var _targetType = _possibleTargets[_p].wordData.wordType;
					var _weaknessArr = [];
					
					var gridHeight = ds_grid_height(global.type_grid);
					for (var _y = 0; _y < gridHeight; _y++) 
					{
						var _value = ds_grid_get(global.type_grid, _targetType, _y);
					
						if (_value == 2)
						{
							array_push(_weaknessArr, _y);
						}
					}
				
					if (array_length(_weaknessArr) > 0)
					{
						for (var _i = 0; _i < array_length(_availableActions); _i++)
						{
							for (var _j = 0; _j < array_length(_weaknessArr); _j++)
							{
								if (_availableActions[_i].wordType == _weaknessArr[_j])
								{
									_target = _possibleTargets[_p];
									_action = _availableActions[_i];
								}
							}
						}
					}
			
				}
				
				// If it can't find an available attack that's strong against the player
				// then it chooses a random available attack
				if (_action == -1)
				{
					_target = _possibleTargets[irandom(array_length(_possibleTargets) - 1)];
					_action = _availableActions[irandom(array_length(_availableActions) - 1)];
				}
			}
			
			return [_action, _target];
			
			// Attack random party member
			//var _action = actions[0];
			//var _possibleTargets = array_filter(obj_battle.partyUnits, function(_unit, _index)
			//{
			//	return (_unit.hp > 0);
			//});
			//var _target = _possibleTargets[irandom(array_length(_possibleTargets) - 1)];
			//return [_action, _target];
		}
	}
}

// Words Array
global.words = 
{
	boring: 
	{
		name: "Boring",
		description: "{0} used Boring!",
		subMenu: "Lexicon",
		targetRequired: true,
		targetEnemyByDefault: true,
		targetAll: MODE.NEVER,
		userAnimation: "attack",
		effectSprite: spr_attack_bonk,
		effectOnTarget: MODE.ALWAYS,
		wordType: TYPE.NORMAL,
		obtained: true,
		available: true,
		func: function(_user, _targets)
		{
			BattleWordInsert(global.words.boring, _targets[0]);
			global.words.boring.available = false;
		}
		
	},
	lava: 
	{
		name: "Lava",
		description: "{0} used Lava!",
		subMenu: "Lexicon",
		targetRequired: true,
		targetEnemyByDefault: true,
		targetAll: MODE.NEVER,
		userAnimation: "attack",
		effectSprite: spr_attack_bonk,
		effectOnTarget: MODE.ALWAYS,
		wordType: TYPE.FIRE,
		obtained: true,
		available: true,
		func: function(_user, _targets)
		{
			BattleWordInsert(global.words.lava, _targets[0]);
			global.words.lava.available = false;
		}
		
	},
	drizzle: 
	{
		name: "Drizzle",
		description: "{0} used Drizzle!",
		subMenu: "Lexicon",
		targetRequired: true,
		targetEnemyByDefault: true,
		targetAll: MODE.NEVER,
		userAnimation: "attack",
		effectSprite: spr_attack_bonk,
		effectOnTarget: MODE.ALWAYS,
		wordType: TYPE.WATER,
		obtained: true,
		available: true,
		func: function(_user, _targets)
		{
			BattleWordInsert(global.words.drizzle, _targets[0]);
			global.words.drizzle.available = false;
		}
		
	},
	battery: 
	{
		name: "Battery",
		description: "{0} used Battery!",
		subMenu: "Lexicon",
		targetRequired: true,
		targetEnemyByDefault: true,
		targetAll: MODE.NEVER,
		userAnimation: "attack",
		effectSprite: spr_attack_bonk,
		effectOnTarget: MODE.ALWAYS,
		wordType: TYPE.ELECTRIC,
		obtained: true,
		available: true,
		func: function(_user, _targets)
		{
			BattleWordInsert(global.words.battery, _targets[0]);
			global.words.battery.available = false;
		}
		
	},
	lawnmower: 
	{
		name: "Lawnmower",
		hp: 100,
		description: "{0} used Lawnmower!",
		subMenu: "Lexicon",
		targetRequired: true,
		targetEnemyByDefault: true,
		targetAll: MODE.NEVER,
		userAnimation: "attack",
		effectSprite: spr_attack_bonk,
		effectOnTarget: MODE.ALWAYS,
		wordType: TYPE.GRASS,
		obtained: true,
		available: true,
		func: function(_user, _targets)
		{
			BattleWordInsert(global.words.lawnmower, _targets[0]);
			global.words.lawnmower.available = false;
		}
		
	},
	frigid: 
	{
		name: "Frigid",
		description: "{0} used Frigid!",
		subMenu: "Lexicon",
		targetRequired: true,
		targetEnemyByDefault: true,
		targetAll: MODE.NEVER,
		userAnimation: "attack",
		effectSprite: spr_attack_bonk,
		effectOnTarget: MODE.ALWAYS,
		wordType: TYPE.ICE,
		obtained: true,
		available: true,
		func: function(_user, _targets)
		{
			BattleWordInsert(global.words.frigid, _targets[0]);
			global.words.frigid.available = false;
		}
		
	},
	kumite: 
	{
		name: "Kumite",
		description: "{0} used Kumite!",
		subMenu: "Lexicon",
		targetRequired: true,
		targetEnemyByDefault: true,
		targetAll: MODE.NEVER,
		userAnimation: "attack",
		effectSprite: spr_attack_bonk,
		effectOnTarget: MODE.ALWAYS,
		wordType: TYPE.FIGHTING,
		obtained: true,
		available: true,
		func: function(_user, _targets)
		{
			BattleWordInsert(global.words.kumite, _targets[0]);
			global.words.kumite.available = false;
		}
		
	},
	arsenic: 
	{
		name: "Arsenic",
		description: "{0} used Arsenic!",
		subMenu: "Lexicon",
		targetRequired: true,
		targetEnemyByDefault: true,
		targetAll: MODE.NEVER,
		userAnimation: "attack",
		effectSprite: spr_attack_bonk,
		effectOnTarget: MODE.ALWAYS,
		wordType: TYPE.POISON,
		obtained: true,
		available: true,
		func: function(_user, _targets)
		{
			BattleWordInsert(global.words.arsenic, _targets[0]);
			global.words.arsenic.available = false;
		}
		
	},
	soil: 
	{
		name: "Soil",
		description: "{0} used Soil!",
		subMenu: "Lexicon",
		targetRequired: true,
		targetEnemyByDefault: true,
		targetAll: MODE.NEVER,
		userAnimation: "attack",
		effectSprite: spr_attack_bonk,
		effectOnTarget: MODE.ALWAYS,
		wordType: TYPE.GROUND,
		obtained: true,
		available: true,
		func: function(_user, _targets)
		{
			BattleWordInsert(global.words.soil, _targets[0]);
			global.words.soil.available = false;
		}
		
	},
	helicopter: 
	{
		name: "Helicopter",
		description: "{0} used Helicopter!",
		subMenu: "Lexicon",
		targetRequired: true,
		targetEnemyByDefault: true,
		targetAll: MODE.NEVER,
		userAnimation: "attack",
		effectSprite: spr_attack_bonk,
		effectOnTarget: MODE.ALWAYS,
		wordType: TYPE.FLYING,
		obtained: true,
		available: true,
		func: function(_user, _targets)
		{
			BattleWordInsert(global.words.helicopter, _targets[0]);
			global.words.helicopter.available = false;
		}
		
	},
	premonition: 
	{
		name: "Premonition",
		description: "{0} used Premonition!",
		subMenu: "Lexicon",
		targetRequired: true,
		targetEnemyByDefault: true,
		targetAll: MODE.NEVER,
		userAnimation: "attack",
		effectSprite: spr_attack_bonk,
		effectOnTarget: MODE.ALWAYS,
		wordType: TYPE.PSYCHIC,
		obtained: true,
		available: true,
		func: function(_user, _targets)
		{
			BattleWordInsert(global.words.premonition, _targets[0]);
			global.words.premonition.available = false;
		}
		
	},
	cockroach: 
	{
		name: "Cockroach",
		description: "{0} used Cockroach!",
		subMenu: "Lexicon",
		targetRequired: true,
		targetEnemyByDefault: true,
		targetAll: MODE.NEVER,
		userAnimation: "attack",
		effectSprite: spr_attack_bonk,
		effectOnTarget: MODE.ALWAYS,
		wordType: TYPE.BUG,
		obtained: true,
		available: true,
		func: function(_user, _targets)
		{
			BattleWordInsert(global.words.cockroach, _targets[0]);
			global.words.cockroach.available = false;
		}
		
	},
	cliff: 
	{
		name: "Cliff",
		description: "{0} used Cliff!",
		subMenu: "Lexicon",
		targetRequired: true,
		targetEnemyByDefault: true,
		targetAll: MODE.NEVER,
		userAnimation: "attack",
		effectSprite: spr_attack_bonk,
		effectOnTarget: MODE.ALWAYS,
		wordType: TYPE.ROCK,
		obtained: true,
		available: true,
		func: function(_user, _targets)
		{
			BattleWordInsert(global.words.cliff, _targets[0]);
			global.words.cliff.available = false;
		}
		
	},
	phantasm: 
	{
		name: "Phantasm",
		description: "{0} used Phantasm!",
		subMenu: "Lexicon",
		targetRequired: true,
		targetEnemyByDefault: true,
		targetAll: MODE.NEVER,
		userAnimation: "attack",
		effectSprite: spr_attack_bonk,
		effectOnTarget: MODE.ALWAYS,
		wordType: TYPE.GHOST,
		obtained: true,
		available: true,
		func: function(_user, _targets)
		{
			BattleWordInsert(global.words.phantasm, _targets[0]);
			global.words.phantasm.available = false;
		}
		
	},
	wyvern: 
	{
		name: "Wyvern",
		description: "{0} used Wyvern!",
		subMenu: "Lexicon",
		targetRequired: true,
		targetEnemyByDefault: true,
		targetAll: MODE.NEVER,
		userAnimation: "attack",
		effectSprite: spr_attack_bonk,
		effectOnTarget: MODE.ALWAYS,
		wordType: TYPE.DRAGON,
		obtained: true,
		available: true,
		func: function(_user, _targets)
		{
			BattleWordInsert(global.words.wyvern, _targets[0]);
			global.words.wyvern.available = false;
		}
	},
};

global.items = 
{
	aftershave: 
	{
		name: "Aftershave",
		description: "{0} used aftershave!",
		subMenu: "Items",
		targetRequired: true,
		targetEnemyByDefault: true,
		targetAll: MODE.NEVER,
		userAnimation: "attack",
		effectSprite: spr_attack_bonk,
		effectOnTarget: MODE.NEVER,
		available: true,
		func: function()
		{
			show_debug_message("Aftershave was used!");
		}
	},
	
	rubber: 
	{
		name: "Rubber",
		description: "{0} used rubber!",
		subMenu: "Items",
		targetRequired: true,
		targetEnemyByDefault: true,
		targetAll: MODE.NEVER,
		userAnimation: "attack",
		effectSprite: spr_attack_bonk,
		effectOnTarget: MODE.ALWAYS,
		available: true,
		func: function()
		{
			show_debug_message("Rubber was used!");
		}
	},
	
	thing: 
	{
		name: "Thing",
		description: "{0} used something thing!",
		subMenu: "Items",
		targetRequired: true,
		targetEnemyByDefault: true,
		targetAll: MODE.NEVER,
		userAnimation: "attack",
		effectSprite: spr_attack_bonk,
		effectOnTarget: MODE.ALWAYS,
		available: true,
		func: function()
		{
			show_debug_message("Thing was used!");
		}
	},
};

