/// @description Initialise and Globals

randomise();
temp_zoom_level = 0;

global.gamePaused = false;
global.controlled = CONTROL.PLAYER;

global.textSpeed = 0.75;
global.isWarp = false;
global.playerHealthMax = 100;
global.playerHealth = global.playerHealthMax;
global.attractBeingPressed = false;
global.objectCurrentlyBeingPushed = false;
global.rubberInstanceExists = false;
global.allowAttractMovement = false;
global.playerAmmoMax[ITEM.RUBBER] = 15;

//Pencil Power
global.playerPencilPowerMax = 5;
global.playerPencilPower = global.playerPencilPowerMax;
global.playerPencilPowerMulti = 1;

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

// Score
global.scoreMax = 0;
global.scoreCurrent = global.scoreMax;
global.scoreAnimation = 0;

// Drop Lists
global.entityDropListBasic = [
[obj_coffee_collect],
[obj_energy_drink_collect, obj_coffee_collect],
[obj_rubber_collect],
[obj_no_item]
];

// Warps
global.warpX = -1;
global.warpY = -1;
global.warpToX = -1;
global.warpToY = -1;

global.entityDropListSharpener = [[obj_sharpener_collect]];

global.iUI = instance_create_layer(0, 0, "GUI", obj_UI);

// Deactivate other camera zones
instance_deactivate_layer("camera_christmas");
// instance_deactivate_layer("Tiles_Christmas");