_left = x;
_right = x + 32;
_top = y;
_bottom = y + 48;

if (instance_exists(obj_dialog_box)) {
	_status = "dialog";
}

else {
	_status = "overworld";
}

if (keyboard_check(vk_left) && _status == "overworld") {
	x -= 3;
}

if (keyboard_check(vk_right) && _status == "overworld") {
	x += 3;
}

if (keyboard_check(vk_up) && _status == "overworld") {
	y -= 3;
}

if (keyboard_check(vk_down) &&  _status == "overworld") {
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

if (_left > 200) {
	_temp = 1;
}

else {
	_temp = 0;
}

if (keyboard_check_pressed(ord("Z"))) {
	switch (_status) {
		case "overworld":
			if (place_meeting(x+3, y+3, obj_npc) || place_meeting(x-3, y-3, obj_npc)) {
				_current_npc = instance_nearest(x, y, obj_npc);
				_function = _current_npc._event;
				_function[0](_function[1]);
			}
			else {
				open_dialog("No problem here.");
			}
			break;
	}
}