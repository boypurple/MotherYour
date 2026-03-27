//Draw background
draw_sprite(battleBackground, -1, x, y)

//Draw units in depth order
var _unitWithCurrentTurn = unitTurnOrder[turn].id
for(var i = 0; i < array_length(unitRenderOrder); i++)
{
	with(unitRenderOrder[i])
	{
		draw_self()
	}
}

//Draw ui boxes
draw_sprite_stretched(sBox, 0, x + 75, y + 300, 565, 60)
draw_sprite_stretched(sBox, 0, x, y + 300, 74, 60)

//Positions
#macro COLLUMN_ENEMY 6
#macro COLLUMN_NAME 81
#macro COLLUMN_HP 160
#macro COLLUMN_PP 220

//Draw Headings
draw_set_font(fnMother3)
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_set_colour(c_gray)
draw_text(x + COLLUMN_ENEMY, y + 302, "ENEMY")
draw_text(x + COLLUMN_NAME, y + 302, "NAME")
draw_text(x + COLLUMN_HP, y + 302, "HP")
draw_text(x + COLLUMN_PP, y + 302, "PP")

//Draw enemy names
draw_set_font(fnMother3)
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_set_colour(c_white)
var _drawLimit = 3
var _draw = 0
for(var i = 0; (i < array_length(enemyUnits)) && (_draw < _drawLimit); i++)
{
	var _char = enemyUnits[i]
	if(_char.hp > 0)
	{
		_draw++
		draw_set_colour(c_white)
		if(_char.id == _unitWithCurrentTurn) draw_set_colour(c_yellow)
		draw_text(x + COLLUMN_ENEMY, y + 320 + (i * 20), _char.name)
	}
}

//Draw party info
for(var i = 0; i < array_length(partyUnits); i++)
{
	draw_set_halign(fa_left)
	draw_set_colour(c_white)
	var _char = partyUnits[i]
	if(_char.id == _unitWithCurrentTurn) draw_set_colour(c_yellow)
	if(_char.hp <= 0) draw_set_colour(c_red)
	draw_text(x + COLLUMN_NAME, y + 320 + (i * 20), _char.name)
	
	draw_set_colour(c_white)
	if(_char.hp < (_char.hpMax * .5)) draw_set_colour(c_orange)
	if(_char.hp <= 0) draw_set_colour(c_red)
	draw_text(x + COLLUMN_HP, y + 320 + (i * 20), string(_char.hp) + "/" + string(_char.hpMax))
	
	draw_set_colour(c_white)
	if(_char.pp < (_char.ppMax * .5)) draw_set_colour(c_orange)
	if(_char.pp <= 0) draw_set_colour(c_red)
	draw_text(x + COLLUMN_PP, y + 320 + (i * 20), string(_char.pp) + "/" + string(_char.ppMax))
	
	draw_set_colour(c_white)
}

//Draw target cursor
if(cursor.active)
{
	with(cursor)
	{
		if(activeTarget != noone)
		{
			if(!is_array(activeTarget))
			{
				draw_sprite(sCursor, 0, activeTarget.x, activeTarget.y)
			}
			else
			{
				draw_set_alpha(sin(get_timer() / 50000) + 1)
				for(var i = 0; i < array_length(activeTarget); i++)
				{
					draw_sprite(sCursor, 0, activeTarget[i].x, activeTarget[i].y)
				}
				draw_set_alpha(1.0)
			}
		}
	}
}

//Draw Battle Text
if(battleText != "")
{
	var _w = string_width(battleText) + 20
	draw_sprite_stretched(sBox, 0, x + 160 - (_w * 0.5), y + 5, _w, 25)
	draw_set_halign(fa_center)
	draw_set_colour(c_white)
	draw_text(x + 160, y + 10, battleText)
}