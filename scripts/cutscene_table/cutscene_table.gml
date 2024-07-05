function scene_one() {
	if (obj_player.x > 300) {
		obj_player.x -= 3;
		return 0;
	}
	
	return 1;
}
