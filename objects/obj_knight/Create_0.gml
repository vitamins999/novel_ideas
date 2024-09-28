// Inherit the parent event
event_inherited();

state = ENEMY_STATE.WANDER;

// Enemy Sprites
sprMove = spr_knight_idle;

// Enemy Scripts
enemyScript[ENEMY_STATE.WANDER] = DarkKnightWander;
enemyScript[ENEMY_STATE.CHASE] = DarkKnightChase;
enemyScript[ENEMY_STATE.HURT] = DarkKnightHurt;
enemyScript[ENEMY_STATE.DIE] = DarkKnightDie;

// Set up variables
startFrame = choose(0, 4, 8);
endFrame = startFrame + 4;
dieAnimationStarted = false;