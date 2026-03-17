//Action Library
global.actionLibrary =
{
	attack:
	{
		name: "Attack",
		description: "{0} attacks!",
		subMenu: -1,
		targetRequired: true,
		targetEnemyByDefault: true,
		targetAll: MODE.NEVER,
		userAnimation: "attack",
		effectSprite: sAttack,
		effectOnTarget: MODE.ALWAYS,
		func: function(_user, _targets)
		{
			var _damage = ceil(_user.strength + random_range(-_user.strength * 0.25, _user.strength * 0.25))
			BattleChangeHP(_targets[0], -_damage, 0)
		}
	}
}

enum MODE
{
	NEVER = 0,
	ALWAYS = 1,
	VARIES = 2
}

//Party Data
global.party =
[
	{
		name: "Chris",
		lvl: 1,
		hp: 11,
		hpMax: 12,
		pp: 4,
		ppMax: 5,
		def: 1,
		spd: 1,
		wrath: 1,
		iq: 1,
		strength: 6,
		sprites: {idle: sChrisU, down: sChrisU},
		actions: [global.actionLibrary.attack]
	}
	,
	{
		name: "Michael",
		lvl: 1,
		hp: 10,
		hpMax: 12,
		pp: 0,
		ppMax: 0,
		def: 2,
		spd: 2,
		wrath: 2,
		iq: 2,
		strength: 4,
		sprites: {idle: sChrisU, down: sChrisU},
		actions: [global.actionLibrary.attack]
	}
]

//Enemy Data
global.enemies =
{
	boar:
	{
		name: "Boar",
		hp: 30,
		hpMax: 30,
		pp: 0,
		ppMax: 0,
		def: 1,
		spd: 1,
		wrath: 1,
		iq: 1,
		strength: 5,
		actions: [global.actionLibrary.attack],
		sprites: {idle: sEnemy},
		xpValue: 15,
		AIscript: function()
		{
			//enemy turn ai goes here
			//Attack random party member
			var _action = actions[0]
			var _possibleTargets = array_filter(oBattle.partyUnits, function(_unit, _index)
			{
				return (_unit.hp > 0)
			})
			var _target = _possibleTargets[irandom(array_length(_possibleTargets) - 1)]
			return [_action, _target]
		}
	}
}