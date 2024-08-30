// Inherit the parent event
event_inherited();

state = ENEMY_STATE.WANDER;

// Enemy Sprites
sprMove = spr_editork;

// Enemy Scripts
enemyScript[ENEMY_STATE.WANDER] = EditorkWander;
enemyScript[ENEMY_STATE.CHASE] = EditorkChase;