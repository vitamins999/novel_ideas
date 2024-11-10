if (global.gamePaused) audio_sound_gain(snd_pause_music, 1, 3000);
if (!global.gamePaused)
{
	audio_sound_gain(snd_pause_music, 0, 0);
}