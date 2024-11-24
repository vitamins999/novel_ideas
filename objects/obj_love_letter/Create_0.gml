// Inherit the parent event
event_inherited();

state = ENEMY_STATE.WANDER;

// Enemy Sprites
sprMove = spr_love_letter_big;
sprAttack = spr_love_letter_attack;
sprHurt = spr_love_letter_hurt;
sprDie = spr_love_letter_die;
sprAttract = spr_love_letter_blush;

// Enemy Scripts
enemyScript[ENEMY_STATE.WANDER] = LoveLetterWander;
enemyScript[ENEMY_STATE.ATTACK] = LoveLetterAttack;
enemyScript[ENEMY_STATE.HURT] = LoveLetterHurt;
enemyScript[ENEMY_STATE.DIE] = LoveLetterDie;
enemyScript[ENEMY_STATE.DIE_RUBBER] = LoveLetterDieRubber;
enemyScript[ENEMY_STATE.RETREAT] = LoveLetterRetreat;

// Set up variables
startFrame = choose(0, 4, 8);
endFrame = startFrame + 4;
dieAnimationStarted = false;

retreatX = -1;
retreatY = -1;

// Droplist Create
entityDropList = array_create(array_length(global.entityDropListBasic));
array_copy(entityDropList, 0, global.entityDropListBasic, 0, array_length(global.entityDropListBasic));
// Check if Replace with Sharpener
entityDropList = IsDropReplacedBySharpener(entityDropList);