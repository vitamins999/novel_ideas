// Inherit the parent event
event_inherited();

state = ENEMY_STATE.WANDER;

// Enemy Sprites
sprMove = spr_editork;
// ADD SPRITES FOR HURT AND DIE

// Enemy Scripts
enemyScript[ENEMY_STATE.WANDER] = EditorkWander;
enemyScript[ENEMY_STATE.CHASE] = EditorkChase;
enemyScript[ENEMY_STATE.HURT] = EditorkHurt;
enemyScript[ENEMY_STATE.DIE] = EditorkDie;