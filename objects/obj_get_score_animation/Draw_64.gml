var pX = (enemyX - camera_get_view_x(view_camera[0])) + enemyXStep;
var pY = (enemyY - camera_get_view_y(view_camera[0])) + enemyYStep;
   pX *= display_get_gui_width() / camera_get_view_width(view_camera[0])
   pY *= display_get_gui_height() / camera_get_view_height(view_camera[0])
DrawSetText(c_white, fnt_score_text, fa_center, fa_bottom);
DrawTextOutline(pX, pY - 5, $"{global.scoreAnimation}", 2,c_blue,4,20,500);

enemyYStep -= 0.25;