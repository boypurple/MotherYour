if (instance_exists(_target)) {
	_view_x = _target.x;
	_view_y = _target.y;
	_vm = matrix_build_lookat(_view_x, _view_y, -10, _view_x, _view_y, 0, 0, 1, 0);
	camera_set_view_mat(_camera, _vm);
}