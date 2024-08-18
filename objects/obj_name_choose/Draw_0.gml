_y = 0;

for (var _i = 0; _i <= string_length(_lowercase); _i++;) {
	_x = math_string_sort(_i);
	if (_x == 0) {
		_y += 20;
	}
	
	if (_mode == "lowercase") {
		draw_text(camera_get_view_x(view_camera[0])+(_x*20), camera_get_view_y(view_camera[0])+_y, string_char_at(_lowercase, _i+1));
	}
	else {
		draw_text(camera_get_view_x(view_camera[0])+(_x*20), camera_get_view_y(view_camera[0])+_y, string_char_at(_uppercase, _i+1));
	}
}

