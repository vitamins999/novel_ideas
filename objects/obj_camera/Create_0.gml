// Divide by 4 = internal resolution of 360 x 270
// Divide by 5 = internal resolution of 288 x 216
// Divide by 6 = internal resolution of 240 x 180
// SNES = internal resolution 256 x 224

// my monitor: 2560 x 1440

// Widescreen
//view_width = 320;
//view_height = 180;

//Fullscreen (SNES)
view_width = RESOLUTION_W;
view_height = RESOLUTION_H - 4;

window_scale = 3;
max_window_scale = floor(display_get_height() / view_height);

display_set_gui_size(view_width * 2, view_height * 2);
window_set_size(view_width * window_scale, view_height * window_scale);
alarm[0] = 1;

surface_resize(application_surface, view_width * window_scale, view_height * window_scale);

global.camera_zone = noone;
global.view_width = view_width;
global.view_height = view_height;
global.zoom_level = window_scale;