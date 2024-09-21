// Inherit the parent event
event_inherited();

state = ENEMY_STATE.WANDER;

// Enemy Sprites
sprMove = spr_editork;
sprDie = spr_editork_die;

// Enemy Scripts
enemyScript[ENEMY_STATE.WANDER] = EditorkWander;
enemyScript[ENEMY_STATE.CHASE] = EditorkChase;
enemyScript[ENEMY_STATE.HURT] = EditorkHurt;
enemyScript[ENEMY_STATE.DIE] = EditorkDie;

// Set up variables
startFrame = choose(0, 4, 9);
endFrame = startFrame + 3;
sprDie.image_index = startFrame;