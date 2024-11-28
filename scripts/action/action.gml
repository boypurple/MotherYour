function action(_args) {
	if (!struct_exists(_args, "type")) {
		open_dialog(_args._text);
	}
	
	else {
		_args._function(_args._value);
	}
}