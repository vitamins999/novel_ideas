// Inherit the parent event
event_inherited();

state = ENEMY_STATE.WANDER;

// Enemy Sprites
sprMove = spr_editork_outline_grey;
sprHurt = spr_editork_hurt;
sprDie = spr_editork_die;
sprAttract = spr_editork_blush;

// Enemy Scripts
enemyScript[ENEMY_STATE.WANDER] = EditorkWander;
enemyScript[ENEMY_STATE.CHASE] = EditorkChase;
enemyScript[ENEMY_STATE.HURT] = EditorkHurt;
enemyScript[ENEMY_STATE.DIE] = EditorkDie;
enemyScript[ENEMY_STATE.DIE_RUBBER] = EditorkDieRubber;

// Set up variables
startFrame = choose(0, 4, 8);
endFrame = startFrame + 4;
dieAnimationStarted = false;

// Droplist Create
entityDropList = array_create(array_length(global.entityDropListBasic));
array_copy(entityDropList, 0, global.entityDropListBasic, 0, array_length(global.entityDropListBasic));
// Check if Replace with Sharpener
entityDropList = IsDropReplacedBySharpener(entityDropList);