//Data
global.coins = 0
global.volume = 100
global.volumeSE = 100

global.gamePaused = false
global.config = false
global.configAudio = false
global.configVideo = false
global.configControl = false

#macro RESOLUTION_W 1280
#macro RESOLUTION_H 720

#macro TILE_SIZE 32

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
			var _b = 0
			var _blind = 0
			var _hit = 100
			var _nut = 0
			
			if(_user.afo) _hit = _hit * 2
			
			if(_user.itchy)
			{
				_b = _hit / 2
			}
			else
			{
				_b = 0
			}
			
			if(_user.blind)
			{
				_blind = _hit / 4
			}
			else
			{
				_blind = 0
			}
			
			if(_user.noNut)
			{
				_nut = 0.25
			}
			else
			{
				_nut = 0
			}
			
			_targets[0].def = (_targets[0].def - (_targets[0].def * _nut))
			
			if(_targets[0].def + _b + _blind >= irandom(100))
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
			var _b = 0
			var _blind = 0
			var _hit = 100
			
			if(_user.afo) _hit = _hit * 2
			
			if(_user.itchy)
			{
				_b = _hit / 2
			}
			else
			{
				_b = 0
			}
			
			if(_user.blind)
			{
				_blind = _hit / 4
			}
			else
			{
				_blind = 0
			}
			
			if(_user.noNut)
			{
				_nut = 0.25
			}
			else
			{
				_nut = 0
			}
			
			_targets[0].def = (_targets[0].def - (_targets[0].def * _nut))
			
			if(_targets[0].def + _b + _blind >= irandom(100))
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
				var _damage = irandom_range(100, 120)
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
					
					// Applies the stun variable to the target (adapt to the name you use in your project).
					_targets[0].mutatedHand = true; // ou _targets[0].stunTurns = 1;
				
					// Exibe um texto flutuante amarelo avisando do Stun
					instance_create_depth
					(
						_targets[0].x,
						_targets[0].y - 40, // Sobe um pouco para não encavalar com o texto de dano
						_targets[0].depth - 1,
						oBattleFloatingText,
						{font: fnMother3, col: c_yellow, text: "Mutated Hand!"}
					)
					
					// Applies the stun variable to the target (adapt to the name you use in your project).
					_targets[0].itchy = true; // ou _targets[0].stunTurns = 1;
				
					// Exibe um texto flutuante amarelo avisando do Stun
					instance_create_depth
					(
						_targets[0].x,
						_targets[0].y - 60, // Sobe um pouco para não encavalar com o texto de dano
						_targets[0].depth - 1,
						oBattleFloatingText,
						{font: fnMother3, col: c_yellow, text: "Itchy!"}
					)
					
					// Applies the stun variable to the target (adapt to the name you use in your project).
					_targets[0].poisoned = true; // ou _targets[0].stunTurns = 1;
					_targets[0].poison = "a"
				
					// Exibe um texto flutuante amarelo avisando do Stun
					instance_create_depth
					(
						_targets[0].x,
						_targets[0].y - 80, // Sobe um pouco para não encavalar com o texto de dano
						_targets[0].depth - 1,
						oBattleFloatingText,
						{font: fnMother3, col: c_yellow, text: "Poisoned!"}
					)
					
					// Applies the stun variable to the target (adapt to the name you use in your project).
					_targets[0].jackpot = true; // ou _targets[0].stunTurns = 1;
				
					// Exibe um texto flutuante amarelo avisando do Stun
					instance_create_depth
					(
						_targets[0].x,
						_targets[0].y - 100, // Sobe um pouco para não encavalar com o texto de dano
						_targets[0].depth - 1,
						oBattleFloatingText,
						{font: fnMother3, col: c_yellow, text: "Jackpot!"}
					)
					
					// Applies the stun variable to the target (adapt to the name you use in your project).
					_targets[0].blind = true; // ou _targets[0].stunTurns = 1;
				
					// Exibe um texto flutuante amarelo avisando do Stun
					instance_create_depth
					(
						_targets[0].x,
						_targets[0].y - 120, // Sobe um pouco para não encavalar com o texto de dano
						_targets[0].depth - 1,
						oBattleFloatingText,
						{font: fnMother3, col: c_yellow, text: "Blind!"}
					)
					
					// Applies the stun variable to the target (adapt to the name you use in your project).
					_targets[0].sleep = true; // ou _targets[0].stunTurns = 1;
				
					// Exibe um texto flutuante amarelo avisando do Stun
					instance_create_depth
					(
						_targets[0].x,
						_targets[0].y - 140, // Sobe um pouco para não encavalar com o texto de dano
						_targets[0].depth - 1,
						oBattleFloatingText,
						{font: fnMother3, col: c_yellow, text: "Sleep!"}
					)
					
					//if(!_targets[0].afo)
					//{
					//	// Applies the stun variable to the target (adapt to the name you use in your project).
					//	_targets[0].afo = true; // ou _targets[0].stunTurns = 1;
					//	_targets[0].def += 1;
					//	_targets[0].strength += 1;
				
					//	// Exibe um texto flutuante amarelo avisando do Stun
					//	instance_create_depth
					//	(
					//		_targets[0].x,
					//		_targets[0].y - 160, // Sobe um pouco para não encavalar com o texto de dano
					//		_targets[0].depth - 1,
					//		oBattleFloatingText,
					//		{font: fnMother3, col: c_yellow, text: "All For One!"}
					//	)
					//}
					
					//if(!_targets[0].hyper)
					//{
					//	// Applies the stun variable to the target (adapt to the name you use in your project).
					//	_targets[0].hyper = true; // ou _targets[0].stunTurns = 1;
					//	_targets[0].spd += 1;
				
					//	// Exibe um texto flutuante amarelo avisando do Stun
					//	instance_create_depth
					//	(
					//		_targets[0].x,
					//		_targets[0].y - 160, // Sobe um pouco para não encavalar com o texto de dano
					//		_targets[0].depth - 1,
					//		oBattleFloatingText,
					//		{font: fnMother3, col: c_yellow, text: "Hyper!"}
					//	)
					//}
				}
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
		mutatedHand: false,
		itchy: false,
		itnum: 0,
		poisoned: false,
		ponum: 0,
		poison: "",
		blind: false,
		sleep: false,
		noNut: false,
		soreT: false,
		afo: false,
		hyper: false,
		hynum: 0,
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
		mutatedHand: false,
		itchy: false,
		itnum: 0,
		poisoned: false,
		ponum: 0,
		poison: "",
		blind: false,
		sleep: false,
		noNut: false,
		soreT: false,
		afo: false,
		hyper: false,
		hynum: 0,
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
		def: 1,
		spd: 1,
		wrath: 1,
		iq: 1,
		strength: 5,
		actions: [global.actionLibrary.attack],
		sprites: {idle: sEnemy},
		xpValue: 200,
		coin: 100,
		stunned: false,
		mutatedHand: false,
		itchy: false,
		itnum: 0,
		poisoned: false,
		ponum: 0,
		poison: "",
		jackpot: false,
		blind: false,
		sleep: false,
		noNut: false,
		afo: false,
		hyper: false,
		hynum: 0,
		AIscript: function()
		{
			//enemy turn ai goes here
			//Attack random party member
			var _action = actions[0]
			
			var _possibleTargets = []
			
			var _chan = 1
			var _mut = false
				
			if(mutatedHand) 
			{
				if(_chan < irandom(2)) _mut = true
				if(_mut)
				{
					_possibleTargets = array_filter(oBattle.enemyUnits, function(_unit, _index)
					{
						return (_unit.hp > 0)
					})
				}
				else
				{
					_possibleTargets = array_filter(oBattle.partyUnits, function(_unit, _index)
					{
						return (_unit.hp > 0)
					})
				}
			}
			else
			{
				_possibleTargets = array_filter(oBattle.partyUnits, function(_unit, _index)
				{
					return (_unit.hp > 0)
				})
			}
			
			var _target = _possibleTargets[irandom(array_length(_possibleTargets) - 1)]
			return [_action, _target]
		}
	}
}