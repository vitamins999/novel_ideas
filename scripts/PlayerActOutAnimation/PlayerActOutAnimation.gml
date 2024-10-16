function PlayerActOutAnimation(_sprite, _endScript = -1){
	/// @desc PlayerActOutAnimation(Sprite, EndScript)
	/// @arg Sprite
	/// @arg EndScript
	
	// Carry out an animation and optionally carry out a script when the animation ends
	state = PlayerStateAct;
	sprite_index = _sprite;
	if (argument_count > 1) animationEndScript = _endScript;
	localFrame = 0;
	image_index = 0;
	PlayerAnimateSprite();
}