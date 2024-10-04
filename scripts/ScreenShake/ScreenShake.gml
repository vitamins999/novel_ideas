function ScreenShake(magnitude, frames){
	/// @desc Screenshake(magnitude, frames)
	/// @arg Magnitude sets the strength of the shake (distance remaining)
	/// @arg Frames sets the length of the shake in frames (60 = 1 second)
	
	with (global.iCamera)
	{
		if (magnitude > shakeRemain)
		{
			shakeMagnitude = magnitude;
			shakeRemain = shakeMagnitude;
			shakeLength = frames;
		}
	}
}