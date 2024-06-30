function party_join(_character) {
	obj_player._status = "cutscene";
	if (!instance_exists(obj_cutscene)) {
		var _cutscene = instance_create_layer(0, 0, "Instances_1", obj_cutscene);
		with (_cutscene) {
			if (!_start) {
				audio_pause_all();
				_start = true;
				audio_play_sound(snd_party_join, 2, false);
			}
			else if (!audio_is_playing(snd_party_join)) {
				open_dialog($"{_character} joined you.");
			}
		}
	}
}