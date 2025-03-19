// Randomise
randomize();

// THESE SHOULD EACH RUN WHEN ITEM IS GAINED OR WORD IS GAINED, SO AS TO MAINTAIN CORRECT ORDER
// THESE ONLY EXIST HERE TO TEST WITH ALL AVAILABLE
// Populate action library with words struct and add to Stu's actions.
var _words = variable_struct_get_names(global.words);
for (i = 0; i < array_length(_words); i++)
{
	variable_struct_set(global.actionLibrary, _words[i], global.words[$ _words[i]]);
	array_push(global.party[0][$ "actions"], global.words[$ _words[i]]);
}

// Push item actions onto Stu's actions so it appears after Dictionary in menu
var _items = variable_struct_get_names(global.items);
for (i = 0; i < array_length(_items); i++)
{
	array_push(global.party[0][$ "actions"], global.items[$ _items[i]]);
}

// TYPE GRID

// Reference coods: X = Defend, Y = Attack

enum TYPE
{
	NORMAL = 0,
	FIRE = 1,
	WATER = 2,
	ELECTRIC = 3,
	GRASS = 4,
	ICE = 5,
	FIGHTING = 6,
	POISON = 7,
	GROUND = 8,
	FLYING = 9,
	PSYCHIC = 10,
	BUG = 11,
	ROCK = 12,
	GHOST = 13,
	DRAGON = 14
}

// Create type grid
global.type_grid = ds_grid_create(15, 15);

// Default all entries to 1
ds_grid_clear(global.type_grid, 1);

// Set Super Effectives
global.type_grid[# TYPE.NORMAL, TYPE.FIGHTING] = 2;

global.type_grid[# TYPE.FIRE, TYPE.WATER] = 2;
global.type_grid[# TYPE.FIRE, TYPE.GROUND] = 2;
global.type_grid[# TYPE.FIRE, TYPE.ROCK] = 2;

global.type_grid[# TYPE.WATER, TYPE.ELECTRIC] = 2;
global.type_grid[# TYPE.WATER, TYPE.GRASS] = 2;

global.type_grid[# TYPE.ELECTRIC, TYPE.GROUND] = 2;

global.type_grid[# TYPE.GRASS, TYPE.FIRE] = 2;
global.type_grid[# TYPE.GRASS, TYPE.ICE] = 2;
global.type_grid[# TYPE.GRASS, TYPE.POISON] = 2;
global.type_grid[# TYPE.GRASS, TYPE.FLYING] = 2;
global.type_grid[# TYPE.GRASS, TYPE.BUG] = 2;

global.type_grid[# TYPE.ICE, TYPE.FIRE] = 2;
global.type_grid[# TYPE.ICE, TYPE.FIGHTING] = 2;
global.type_grid[# TYPE.ICE, TYPE.ROCK] = 2;

global.type_grid[# TYPE.FIGHTING, TYPE.FLYING] = 2;
global.type_grid[# TYPE.FIGHTING, TYPE.PSYCHIC] = 2;

global.type_grid[# TYPE.POISON, TYPE.GROUND] = 2;
global.type_grid[# TYPE.POISON, TYPE.PSYCHIC] = 2;
global.type_grid[# TYPE.POISON, TYPE.BUG] = 2;

global.type_grid[# TYPE.GROUND, TYPE.WATER] = 2;
global.type_grid[# TYPE.GROUND, TYPE.GRASS] = 2;
global.type_grid[# TYPE.GROUND, TYPE.ICE] = 2;

global.type_grid[# TYPE.FLYING, TYPE.ELECTRIC] = 2;
global.type_grid[# TYPE.FLYING, TYPE.ICE] = 2;
global.type_grid[# TYPE.FLYING, TYPE.ROCK] = 2;

global.type_grid[# TYPE.PSYCHIC, TYPE.BUG] = 2;

global.type_grid[# TYPE.BUG, TYPE.FIRE] = 2;
global.type_grid[# TYPE.BUG, TYPE.POISON] = 2;
global.type_grid[# TYPE.BUG, TYPE.FLYING] = 2;
global.type_grid[# TYPE.BUG, TYPE.ROCK] = 2;

global.type_grid[# TYPE.ROCK, TYPE.WATER] = 2;
global.type_grid[# TYPE.ROCK, TYPE.GRASS] = 2;
global.type_grid[# TYPE.ROCK, TYPE.FIGHTING] = 2;
global.type_grid[# TYPE.ROCK, TYPE.GROUND] = 2;

global.type_grid[# TYPE.GHOST, TYPE.GHOST] = 2;

global.type_grid[# TYPE.DRAGON, TYPE.ICE] = 2;
global.type_grid[# TYPE.DRAGON, TYPE.DRAGON] = 2;

// Set Not Effectives
global.type_grid[# TYPE.FIRE, TYPE.FIRE] = 0;
global.type_grid[# TYPE.FIRE, TYPE.GRASS] = 0;
global.type_grid[# TYPE.FIRE, TYPE.BUG] = 0;

global.type_grid[# TYPE.WATER, TYPE.FIRE] = 0;
global.type_grid[# TYPE.WATER, TYPE.WATER] = 0;
global.type_grid[# TYPE.WATER, TYPE.ICE] = 0;

global.type_grid[# TYPE.ELECTRIC, TYPE.ELECTRIC] = 0;
global.type_grid[# TYPE.ELECTRIC, TYPE.FLYING] = 0;

global.type_grid[# TYPE.GRASS, TYPE.WATER] = 0;
global.type_grid[# TYPE.GRASS, TYPE.ELECTRIC] = 0;
global.type_grid[# TYPE.GRASS, TYPE.GROUND] = 0;

global.type_grid[# TYPE.ICE, TYPE.ICE] = 0;

global.type_grid[# TYPE.FIGHTING, TYPE.BUG] = 0;
global.type_grid[# TYPE.FIGHTING, TYPE.ROCK] = 0;

global.type_grid[# TYPE.POISON, TYPE.GRASS] = 0;
global.type_grid[# TYPE.POISON, TYPE.FIGHTING] = 0;
global.type_grid[# TYPE.POISON, TYPE.POISON] = 0;

global.type_grid[# TYPE.GROUND, TYPE.POISON] = 0;
global.type_grid[# TYPE.GROUND, TYPE.ROCK] = 0;

global.type_grid[# TYPE.FLYING, TYPE.GRASS] = 0;
global.type_grid[# TYPE.FLYING, TYPE.FIGHTING] = 0;
global.type_grid[# TYPE.FLYING, TYPE.BUG] = 0;

global.type_grid[# TYPE.PSYCHIC, TYPE.FIGHTING] = 0;
global.type_grid[# TYPE.PSYCHIC, TYPE.PSYCHIC] = 0;

global.type_grid[# TYPE.BUG, TYPE.GRASS] = 0;
global.type_grid[# TYPE.BUG, TYPE.FIGHTING] = 0;
global.type_grid[# TYPE.BUG, TYPE.GROUND] = 0;

global.type_grid[# TYPE.ROCK, TYPE.NORMAL] = 0;
global.type_grid[# TYPE.ROCK, TYPE.FIRE] = 0;
global.type_grid[# TYPE.ROCK, TYPE.POISON] = 0;
global.type_grid[# TYPE.ROCK, TYPE.FLYING] = 0;

global.type_grid[# TYPE.GHOST, TYPE.POISON] = 0;
global.type_grid[# TYPE.GHOST, TYPE.BUG] = 0;

global.type_grid[# TYPE.DRAGON, TYPE.FIRE] = 0;
global.type_grid[# TYPE.DRAGON, TYPE.WATER] = 0;
global.type_grid[# TYPE.DRAGON, TYPE.ELECTRIC] = 0;
global.type_grid[# TYPE.DRAGON, TYPE.GRASS] = 0;

// Set No Effects
global.type_grid[# TYPE.NORMAL, TYPE.GHOST] = -1;

global.type_grid[# TYPE.GROUND, TYPE.ELECTRIC] = -1;

global.type_grid[# TYPE.FLYING, TYPE.GROUND] = -1;

global.type_grid[# TYPE.PSYCHIC, TYPE.GHOST] = -1;

global.type_grid[# TYPE.GHOST, TYPE.NORMAL] = -1;
global.type_grid[# TYPE.GHOST, TYPE.FIGHTING] = -1;