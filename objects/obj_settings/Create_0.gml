/// @description Initialise and Globals

randomise();
temp_zoom_level = 0;

global.gamePaused = false;
global.playerHealthMax = 100;
global.playerHealth = global.playerHealthMax;

global.iUI = instance_create_layer(0, 0, "GUI", obj_UI);