function enemy_action() {
	for (var _i = 0; _i < array_length(obj_battle._enemies); _i++) {
		obj_battle._enemies[_i]._actions[random_range(0,4)]();
	}
}

function swinging(_attack, _target) {
	_target._health -= _attack;
}

function recover(_target) {
	_target.health += 10;
}