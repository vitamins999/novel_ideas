draw_set_font(fnt_gui);
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_text(5, 5, $"{global.view_width} x {global.view_height}");
draw_text(5, 20, $"Zoom Level: {global.zoom_level}");

draw_set_halign(fa_right);
draw_set_valign(fa_bottom);
draw_text(display_get_gui_width() - 5, display_get_gui_height() - 20, "Z to toggle Zoom Level");
draw_text(display_get_gui_width() - 5, display_get_gui_height() - 5, "Left click to toggle Fullscreen");