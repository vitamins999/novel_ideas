function AddToScore(_scoreToAdd){
	global.scoreMax += _scoreToAdd;
}

function DisplayKillScore(_killScore, _enemyX, _enemyY){
	global.scoreAnimation = _killScore;
	var _scoreAnimation = instance_create_layer(0, 0, "Instances", obj_get_score_animation);
	_scoreAnimation.enemyX = _enemyX;
	_scoreAnimation.enemyY = _enemyY;
}