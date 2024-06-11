switch (_intro_timer) {
	case 0:
		draw_sprite_ext(spr_battle_intro, int64(_intro_animation), 0, 0, 2, 2, 0, c_white, 1);
		break;
	case 1:
		draw_sprite_ext(spr_battle_intro, 24, 0, 0, 2, 2, 0, c_white, 1);
		draw_sprite_ext(spr_fade_out, int64(_intro_animation), 0, 0, 2, 2, 0, c_white, 1);
		break;
}

if (_intro_timer >= 2) {
	
	draw_sprite_ext(spr_battle_1, image_index, 0, 0, 2, 2, 0, c_white, 1);
	
	for (_sprite = 0; _sprite < array_length(_enemies); _sprite++) {
		if (_enemies[_sprite].hp > 0) {
			draw_sprite_ext(_enemies[_sprite].sprite, -1, (1280/(_enemy_amount+1))*(_sprite+1), 360, 5, 5, 0, _color, 1);
		}
		
		else if (_enemies[_sprite].animation > 0.0) {
			if (!audio_is_playing(snd_enemy_death)) {
				audio_play_sound(snd_enemy_death, 3, false);
			}
			draw_sprite_ext(_enemies[_sprite].sprite, -1, (1280/(_enemy_amount+1))*(_sprite+1), 360, 5, 5, 0, _color, _enemies[_sprite].animation);
			_enemies[_sprite].animation -= 0.05;
		}
	}
	
	draw_sprite_ext(spr_battle_window, -1, 640, 720, 5, 5, 0, c_white, 1);
	draw_set_colour(c_black);
	draw_rectangle(0, 0, 1280, 144, false);
	if (_intro_animation < 9) {
		draw_sprite_ext(spr_fade_in, int64(_intro_animation), 0, 0, 2, 2, 0, c_white, 1);
	}
	else {
		switch (string_length(_hp_str)) {
			case 1:
				_digits_c = real(string_char_at(_hp_str, 1));
				draw_sprite_ext(_digit_sprites[0], 0, 635, 645, 5, 5, 0, c_white, 1);
				draw_sprite_ext(_digit_sprites[0], 0, 675, 645, 5, 5, 0, c_white, 1);
				draw_sprite_ext(_digit_sprites[_digits_c], frac(abs(_hp_1))*8, 715, 645, 5, 5, 0, c_white, 1);
				break;
			case 2:
				_digits_b = real(string_char_at(_hp_str, 1));
				_digits_c = real(string_char_at(_hp_str, 2));
				_copy_b_1 = _digits_b;
				if (_copy_b_2 != _copy_b_1) {
					if (_timer_1 < 7) {
						if (_healing) {
							_hp_2 += 0.125;
						}

						else {
							_hp_2 -= 0.125;
						}

						_timer_1 += 1;
					}
            
					else {
						_copy_b_2 = _copy_b_1;
						_timer_1 = 0;
						_hp_str = 0;
					}
				}
				draw_sprite_ext(_digit_sprites[0], 0, 635, 645, 5, 5, 0, c_white, 1);
				draw_sprite_ext(_digit_sprites[_copy_b_2], frac(abs(_hp_2))*8, 675, 645, 5, 5, 0, c_white, 1);
				draw_sprite_ext(_digit_sprites[_digits_c], frac(abs(_hp_1))*8, 715, 645, 5, 5, 0, c_white, 1);
				break;
			case 3:
				_digits_a = real(string_char_at(_hp_str, 1));
				_digits_b = real(string_char_at(_hp_str, 2));
				_digits_c = real(string_char_at(_hp_str, 3));
				_copy_a_1 = _digits_a;
				_copy_b_1 = _digits_b;
				if (_copy_b_2 != _copy_b_1) {
					if (_timer_1 != 7) {
						if (_healing) {
							_hp_2 += 0.125;
						}

						else {
							_hp_2 -= 0.125;
						}

						_timer_1 += 1;
					}
            
					else {
						_copy_b_2 = _copy_b_1;
						_timer_1 = 0;
						_hp_2 = 0;
					}
				}
        
				if (_copy_a_2 != _copy_a_1) {
					if (_timer_2 != 7) {
						if (_healing) {
							_hp_3 += 0.125;
						}

						else {
							_hp_3 -= 0.125;
						}

						_timer_2 += 1;
					}
            
					else {
						_copy_a_2 = _copy_a_1;
						_timer_2 = 0;
						_hp_3 = 0;
					}
				}
				draw_sprite_ext(_digit_sprites[_copy_a_2], frac(abs(_hp_3))*8, 635, 645, 5, 5, 0, c_white, 1);
				draw_sprite_ext(_digit_sprites[_copy_b_2], frac(abs(_hp_2))*8, 675, 645, 5, 5, 0, c_white, 1);
				draw_sprite_ext(_digit_sprites[_digits_c], frac(abs(_hp_1))*8, 715, 645, 5, 5, 0, c_white, 1);
				break;
		}
		switch (_state) {
			case "menu":
				_color = c_white;
				for (_button = 0; _button < array_length(_actions); _button++) {
					if (_actions[_button] == _actions[_choice]) {
						draw_sprite_ext(spr_button_selected, _button, 120+(120*_button), 70, 5, 5, 0, c_white, 1);
					}
					else {
						draw_sprite_ext(spr_button_unselected, _button, 120+(120*_button), 70, 5, 5, 0, c_white, 1);
					}
				}
				break;
			case "attack":
				_color = make_colour_rgb(55, 55, 55);
				draw_sprite_ext(spr_cursor, -1, (1280/(_enemy_amount+1))*(_target+1), 360, 5, 5, 0, c_white, 1);
				break;
			case "item":
				_color = c_white;
				draw_set_colour(c_white);
				for (_item_text_index = _offset;; _item_text_index++) {
					draw_text_transformed(120, 70, _items[_item_text_index+0]._name, 2, 2, 0);
					if not (_item_text_index+1 < array_length(_items)-1) {
						break;
					}
					draw_text_transformed(240, 70, _items[_item_text_index+1]._name, 2, 2, 0);
					if not (_item_text_index+2 < array_length(_items)-1) {
						break;
					}
					draw_text_transformed(120, 140, _items[_item_text_index+2]._name, 2, 2, 0);
					if not (_item_text_index+3 < array_length(_items)-1) {
						break;
					}
					draw_text_transformed(240, 140, _items[_item_text_index+3]._name, 2, 2, 0);
				}
				break;
			case "dialog":
				_color = c_white;
				draw_set_colour(c_white);
				draw_text_transformed(12, 80, _text, 2, 2, 0);
				if (_text_index < string_length(_text_full) && !audio_is_playing(_sound)) {
					_text_index++;
					_text += string_char_at(_text_full, _text_index);
				}
				break;
		}
	}
}
