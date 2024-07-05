_left = x;
_right = x + 32;
_top = y;
_bottom = y + 48;

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

if ((place_meeting(x+3, y+3, obj_slime) || place_meeting(x-3, y-3, obj_slime)) && _status == "overworld") {
	_status = "battle";
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
				_npc_function = _current_npc._event;
				_npc_function[0](_npc_function[1]);
			}
			else {
				open_dialog("No problem here.");
			}
			break;
	}
}

if (place_meeting(x+3, y+3, obj_event) || place_meeting(x-3, y-3, obj_event)) {
	_status = "cutscene";
	_current_event = instance_nearest(x, y, obj_event);
	_event_function = _current_event._event;
	play_cutscene(_event_function);
}