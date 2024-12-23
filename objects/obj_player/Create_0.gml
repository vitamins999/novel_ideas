state = PlayerStateFree;
stateAttack = AttackSlash;
hitByAttack = -1;
lastState = state;

currentlyEquippedItem = "aftershave";

collisionMap = layer_tilemap_get_id(layer_get_id("col"));

image_speed = 0;
hSpeed = 0;
vSpeed = 0;
speedWalk = 2.0;
speedPush = 1;
distanceBonk = 40;
distanceBonkHeight = 12;
speedBonk = 1.5;
z = 0;
grabbed = noone;

invulnerable = 0;
flash = 0;
flashShader = sh_white_flash;
animationEndScript = -1;

spriteRun = spr_player_run;
spriteIdle = spr_player;
localFrame = 0;

aftershavePuffsActive = false;

moveToX = -1;
moveToY = -1;
movingWithoutPlayer = false;
movingWithoutPlayerSpeed = 0.5;