extends KinematicBody2D

#Variables
export var distance := 100.0
export var speed := 1

onready var _startPos := position.x
var _speedMul = 1


#Functions
func _physics_process(delta):
	position.x += speed*_speedMul
	if (position.x >= (_startPos + distance)) and (_speedMul > 0):
		_speedMul = -1
	elif (position.x <= _startPos) and (_speedMul < 0):
		_speedMul = 1
