if (!_start) {
	audio_play_sound(_sound, 2, false);
	_start = true;
}

else if (!audio_is_playing(_sound)) {
	with (self) {
		instance_destroy();
	}
}




