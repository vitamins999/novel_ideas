state = PlayerStateFree;

collisionMap = layer_tilemap_get_id(layer_get_id("Col"));

image_speed = 0;
hSpeed = 0;
vSpeed = 0;
speedWalk = 2.0;

spriteRun = spr_player_run;
spriteIdle = spr_player;
localFrame = 0;