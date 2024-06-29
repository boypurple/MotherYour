if (_text_current != _text_full) {
	_text_current += string_char_at(_text_full, _text_index);
	_text_index++;
}

if (keyboard_check_pressed(ord("Z"))) {
	if (_text_current != _text_full) {
		_text_current = _text_full;
	}
	else {
		with (self) {
			instance_destroy();
		}
	}
}


