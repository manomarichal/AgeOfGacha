extends Node2D

export var starting_money = 1000

var _money

signal money_changed

func _ready():
	Global.GameManager = self
	_money = starting_money
	emit_signal("money_changed")

func get_current_money():
	return _money
	
func change_money_by(value):
	_money += value
	emit_signal("money_changed")

func add_unit(unit: UnitTypes.UNIT_TYPE):
	add_child(unit)
	
func remove_unit(unit: UnitTypes.UNIT_TYPE):
	change_money_by(unit.money_on_death)
	unit.queue_free()