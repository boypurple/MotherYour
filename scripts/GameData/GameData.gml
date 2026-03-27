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
			if(_targets[0].def >= irandom(100))
			{
				//Attack missed
				instance_create_depth
				(
					_targets[0].x,
					_targets[0].y - 20, // Sobe um pouco para não encavalar com o texto de dano
					_targets[0].depth - 1,
					oBattleFloatingText,
					{font: fnMother3, col: c_yellow, text: "Missed!"}
				)
			}
			else
			{
				var _damage = ceil(_user.strength + random_range(-_user.strength * 0.25, _user.strength * 0.25))
				BattleChangeHP(_targets[0], -_damage)
			}
		}
	}
	,
	stenchA:
	{
		name: "Stench A",
		description: "{0} casts Stench!",
		subMenu: "VZI Attack Skills",
		ppCost: 11,
		targetRequired: true,
		targetEnemyByDefault: true,
		targetAll: MODE.NEVER,
		userAnimation: "attack",
		effectSprite: sAttack1,
		effectOnTarget: MODE.ALWAYS,
		func: function(_user, _targets)
		{
			var _damage = irandom_range(15, 16)
			BattleChangeHP(_targets[0], -_damage)
			BattleChangePP(_user, -ppCost)
			// 2. Stun Logic
			// Defines a chance to stun (e.g., 10%. Change to 100 if guaranteed)
			var _stunChance = 99; 
			
			if (_stunChance >= irandom(100)) && (_targets[0].hp > 0)
			{
				// Applies the stun variable to the target (adapt to the name you use in your project).
				_targets[0].stunned = true; // ou _targets[0].stunTurns = 1;
				
				// Exibe um texto flutuante amarelo avisando do Stun
				instance_create_depth
				(
					_targets[0].x,
					_targets[0].y - 20, // Sobe um pouco para não encavalar com o texto de dano
					_targets[0].depth - 1,
					oBattleFloatingText,
					{font: fnMother3, col: c_yellow, text: "Stunned!"}
				)
			}
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
		xp: 0,
		hp: 11,
		hpMax: 12,
		pp: 100,
		ppMax: 100,
		def: 1,
		spd: 1,
		wrath: 1,
		iq: 1,
		strength: 6,
		stunned: false,
		sprites: { /*idle: sChrisU, down: sChrisU*/},
		actions: [global.actionLibrary.attack, global.actionLibrary.stenchA]
	}
	,
	{
		name: "Michael",
		lvl: 1,
		xp: 0,
		hp: 10,
		hpMax: 12,
		pp: 0,
		ppMax: 0,
		def: 2,
		spd: 2,
		wrath: 2,
		iq: 2,
		strength: 4,
		stunned: false,
		sprites: { /*idle: sChrisU, down: sChrisU*/},
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
		def: 99,
		spd: 1,
		wrath: 1,
		iq: 1,
		strength: 5,
		actions: [global.actionLibrary.attack],
		sprites: {idle: sEnemy},
		xpValue: 200,
		stunned: false,
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