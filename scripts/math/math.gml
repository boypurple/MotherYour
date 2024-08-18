function math_string_sort(_x, _y = 10){
	return round(((_x / _y) - floor(_x / _y)) * _y);
}