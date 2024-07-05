function play_cutscene(_scene) {
	if (!instance_exists(obj_cutscene)) {
		var _cutscene = instance_create_layer(0, 0, "Instances_1", obj_cutscene);
		with (_cutscene) {
			_current_scene = _scene;
		}
	}
}