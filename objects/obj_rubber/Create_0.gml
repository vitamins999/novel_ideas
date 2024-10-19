/// @description Set up variables

global.rubberInstanceExists = true;
localFrame = 0;
totalFrames = 1;
speed = 1;

// Fade out
fadeSpeed = 0;
alarm[0] = 60;
alarm[1] = 120;
alarm[2] = 240;

/// Get New Tilemap
collisionMap = layer_tilemap_get_id(layer_get_id("Col"));

// Setting animation to not animate
image_speed = 0;
