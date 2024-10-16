/// @description Initialise and Globals

randomise();
temp_zoom_level = 0;

global.gamePaused = false;
global.playerHealthMax = 100;
global.playerHealth = global.playerHealthMax;
global.attractBeingPressed = false;
global.rubberInstanceExists = false;
global.allowAttractMovement = false;

// Items
global.playerHasAnyItems = false;
global.playerEquipped = ITEM.AFTERSHAVE;
global.playerAmmo = array_create(ITEM.TYPE_COUNT, -1);
global.playerItemUnlocked = array_create(ITEM.TYPE_COUNT, false);
global.playerAmmo[ITEM.RUBBER] = 0;

// Placeholders for testing
global.playerItemUnlocked[ITEM.AFTERSHAVE] = true;
global.playerHasAnyItems = true;
global.playerItemUnlocked[ITEM.RUBBER] = true;
global.playerAmmo[ITEM.RUBBER] = 15;

global.iUI = instance_create_layer(0, 0, "GUI", obj_UI);