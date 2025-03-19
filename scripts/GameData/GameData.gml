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
		type: TYPE.GRASS,
		obtained: true,
		func: function(_user, _targets)
		{
			BattleWordInsertEnemy(global.enemyWords.hedge, _targets[0]);
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
		type: TYPE.FIRE,
		obtained: true,
		func: function(_user, _targets)
		{
			BattleWordInsertEnemy(global.enemyWords.campfire, _targets[0]);
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
		type: TYPE.WATER,
		obtained: true,
		func: function(_user, _targets)
		{
			BattleWordInsertEnemy(global.enemyWords.pond, _targets[0]);
		}
	}
}

// Enemy Data
global.enemies = 
{
	loveTriangle:
	{
		name: "Love Triangle",
		hp: 10,
		hpMax: 10,
		sprites: {idle: spr_love_triangle},
		actions: [global.enemyWords.hedge, global.enemyWords.campfire, global.enemyWords.pond],
		AIscript: function()
		{
			// Put random enemy word in a random available blank space
			var _action = actions[irandom(array_length(actions) - 1)];
			var _possibleTargets = array_filter(obj_battle.enemyWordsInstanceIDArr, function(_id)
			{
				return (_id.wordStr == "_____");
			});
			
			var _target
			
			if (array_length(_possibleTargets) != 0)
			{
				_target = _possibleTargets[irandom(array_length(_possibleTargets) - 1)];
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
		type: TYPE.NORMAL,
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
		type: TYPE.FIRE,
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
		type: TYPE.WATER,
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
		type: TYPE.ELECTRIC,
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
		type: TYPE.GRASS,
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
		type: TYPE.ICE,
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
		type: TYPE.FIGHTING,
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
		type: TYPE.POISON,
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
		type: TYPE.GROUND,
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
		type: TYPE.FLYING,
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
		type: TYPE.PSYCHIC,
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
		type: TYPE.BUG,
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
		type: TYPE.ROCK,
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
		type: TYPE.GHOST,
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
		type: TYPE.DRAGON,
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
};

