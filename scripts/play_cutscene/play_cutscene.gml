function play_cutscene(_snd) {
	if (!instance_exists(obj_sound)) {
		var _cutscene = instance_create_layer(0, 0, "Instances_1", obj_sound);
		with (_cutscene) {
			_sound = _snd;
		}
	}
}