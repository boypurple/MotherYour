_camera = camera_create();
_vm = matrix_build_lookat(0, 0, -10, 0, 0, 0, 0, 1, 0);
_pm = matrix_build_projection_ortho(1280, 720, 1, 1280);
_view_x = 0;
_view_y = 0;
_target = obj_player;