function InsideView(_id){
	var _cx = camera_get_view_x(VIEW_SCREEN);
    var _cy = camera_get_view_y(VIEW_SCREEN);

    return _id.x > _cx && _id.x < _cx + camera_get_view_width(VIEW_SCREEN)
         && _id.y > _cy && _id.y < _cy + camera_get_view_height(VIEW_SCREEN);
}