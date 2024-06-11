if (keyboard_check(vk_left) && _status == "overworld") {
	x -= 3;
}

if (keyboard_check(vk_right) && _status == "overworld") {
	x += 3;
}

if (keyboard_check(vk_up) && _status == "overworld") {
	y -= 3;
}

if (keyboard_check(vk_down) && _status == "overworld") {
	y += 3;
}

if ((keyboard_check(vk_left) || keyboard_check(vk_right) || keyboard_check(vk_up) || keyboard_check(vk_down)) && _status == "overworld") {
	_animation = -1;
}

else {
	_animation = 0;
}

if (collision_rectangle(bbox_left, bbox_top+4, bbox_right, bbox_bottom+10 , obj_enemy , false, false) && _status == "overworld") {
	_animation = 0;
	instance_create_depth(0, 0, 0, obj_battle);
}