function AddToScore(_scoreToAdd){
	global.scoreMax += _scoreToAdd;
}

function DisplayKillScore(_killScore){
	global.scoreAnimation = _killScore;
	instance_create_layer(0, 0, "Instances", obj_get_score_animation);
}