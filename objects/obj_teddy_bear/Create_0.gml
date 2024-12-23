// Inherit the parent event
event_inherited();

state = ENEMY_STATE.WANDER;

// Enemy Sprites
sprMove = spr_teddy_bear;
sprHurt = spr_teddy_bear;
sprDie = spr_teddy_bear_die;
sprAttract = spr_teddy_bear_blush;

// Enemy Scripts
enemyScript[ENEMY_STATE.WANDER] = TeddyBearWander;
enemyScript[ENEMY_STATE.CHASE] = TeddyBearChase;
enemyScript[ENEMY_STATE.HURT] = TeddyBearHurt;
enemyScript[ENEMY_STATE.DIE] = TeddyBearDie;
enemyScript[ENEMY_STATE.DIE_RUBBER] = TeddyBearDieRubber;

// Set up variables
startFrame = choose(0, 4, 8);
endFrame = startFrame + 4;
dieAnimationStarted = false;

// Droplist Create
entityDropList = array_create(array_length(entityDropListBasic));
array_copy(entityDropList, 0, entityDropListBasic, 0, array_length(entityDropListBasic));
// Check if Replace with Sharpener
entityDropList = IsDropReplacedBySharpener(entityDropList);