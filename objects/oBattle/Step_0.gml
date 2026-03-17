//Run stats machine
battleState()

//Cursor control
if(cursor.active)
{
	with(cursor)
	{
		//Input
		var _keyUp = keyboard_check_pressed(vk_up)
		var _keyDown = keyboard_check_pressed(vk_down)
		var _keyLeft = keyboard_check_pressed(vk_left)
		var _keyRight = keyboard_check_pressed(vk_right)
		var _keyToggle = false
		var _keyConfirm = false
		var _keyCancel = false
		confirmDelay++
		if(confirmDelay > 1)
		{
			_keyConfirm = keyboard_check_pressed(vk_enter)
			_keyCancel = keyboard_check_pressed(vk_escape)
			_keyToggle = keyboard_check_pressed(vk_shift)
		}
		var _moveH = _keyRight - _keyLeft
		var _moveV = _keyDown - _keyUp
		
		//if(_moveV == -1) targetSide = oBattle.partyUnits
		//if(_moveV == 1) targetSide = oBattle.enemyUnits
		
		//Verify target list
		if(targetSide == oBattle.enemyUnits)
		{
			targetSide = array_filter(targetSide, function(_element, _index)
			{
				return _element.hp > 0
			})
		}
		
		//Move between targets
		if(targetAll == false) //Single target mode
		{
			if(_moveH == 1) targetIndex++
			if(_moveH == -1) targetIndex--
			
			//Wrap
			var _targets = array_length(targetSide)
			if(targetIndex < 0) targetIndex = _targets - 1
			if(targetIndex > (_targets - 1)) targetIndex = 0
			
			//Identify target
			activeTarget = targetSide[targetIndex]
			
			//Toggle all mode
			if(activeAction.targetAll == MODE.VARIES) && (_keyToggle) //Switch to all mode
			{
				targetAll = true
			}
		}
		else
		{
			//Target all mode
			activeTarget = targetSide
			if(activeAction.targetAll == MODE.VARIES) && (_keyToggle) //Switch to single mode
			{
				targetAll = false
			}
		}
		
		//Confirm Action
		if(_keyConfirm)
		{
			with(oBattle) BeginAction(cursor.activeUser, cursor.activeAction, cursor.activeTarget)
			with(oMenu) instance_destroy()
			active = false
			confirmDelay = 0
		}
		
		//Cancel & return to menu
		if(_keyCancel) && (!_keyConfirm)
		{
			with(oMenu) active = true
			active = false
			confirmDelay = 0
		}
	}
}