if (keyboard_check_pressed(vk_right) && _index < string_length(_lowercase)) {
	_index++;
	_cursor_x = math_string_sort(_index);
	if (_cursor_x == 0) {
		_cursor_y += 1;
	}
}

if (keyboard_check_pressed(vk_left) && _index > 0) {
	_index--;
	_cursor_x = math_string_sort(_index);
	if (_cursor_x == 9) {
		_cursor_y -= 1;
	}
}

if (keyboard_check_pressed(vk_down)) {
	if (_index+10 < string_length(_lowercase)) {
		_index += 10;
		_cursor_y += 1;
	}
	
	else {
		_index = math_string_sort(_index);
		_cursor_y = 0;
	}
}