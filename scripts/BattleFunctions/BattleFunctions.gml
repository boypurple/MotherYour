function NewEncounter(_enemies, _bg)
{
	instance_create_depth
	(
		camera_get_view_x(view_camera[0]),
		camera_get_view_y(view_camera[0]),
		-9999,
		oBattle,
		{enemies: _enemies, creator: id, battleBackground: _bg}
	)
}

function BattleChangeHP(_target, _amount, _AliveDeadOrEither = 0)
{
	//AliveDeadOrEither: 0 = alive only, 1 = dead only, 2 = any
	var _failed = false
	if(_AliveDeadOrEither == 0) && (_target.hp <= 0) _failed = true
	if(_AliveDeadOrEither == 1) && (_target.hp > 0) _failed = true
	
	var _col = c_white
	if(_amount > 0) _col = c_lime
	if(_failed)
	{
		_col = c_white
		_amount = "failed"
	}
	instance_create_depth
	(
		_target.x,
		_target.y,
		_target.depth - 1,
		oBattleFloatingText,
		{font: fnMother3, col: _col, text: string(_amount)}
	)
	if(!_failed) _target.hp = clamp(_target.hp + _amount, 0, _target.hpMax)
}