function party_join(_character) {
	if (!instance_exists(obj_sound)) {
		var _sound_player = instance_create_layer(0, 0, "Instances_1", obj_sound);
		with (_sound_player) {
			_sound = snd_party_join;
			_next_event = [open_dialog, $"{_character} joined you."];
		}
	}
}
