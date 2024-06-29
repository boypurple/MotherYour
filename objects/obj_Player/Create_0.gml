function get_event() {
	if (_current_npc != noone) {
		if (array_length( _current_npc._events) > _function_index) {
			var _function = _current_npc._events[_function_index][0];
			_function(_current_npc._events[_function_index][1]);
			_function_index++;
		}
	}
}

_animation = 0;
_sprite = spr_player_d_run;
_left = 0;
_right = 0;
_top = 0;
_bottom = 0;
_speed = 4;

_status = "overworld";

_attack = 5;

_temp = 0;

_function_index = 0;
_current_npc = noone;