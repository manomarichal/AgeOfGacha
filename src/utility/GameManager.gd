extends Node2D

export var starting_money = 150


var _money

signal money_changed

func _ready():
	MainMenuMusic.stop_main_music()
	Global.GameManager = self
	_money = starting_money
	emit_signal("money_changed")

func get_current_money():
	return _money
	
func change_money_by(value):
	_money += value
	if value > 0: 
		Currency.current_coinels += value*3
	emit_signal("money_changed")

func add_unit(unit: UnitTypes.UNIT_TYPE):
	add_child(unit)

