/// @description Draw Score
var _scoreCurrent = global.scoreCurrent;

DrawSetText(c_white, fnt_gui, fa_left, fa_top);
DrawTextOutline(5, 0, $"${_scoreCurrent}", 2,c_blue,4,20,500);