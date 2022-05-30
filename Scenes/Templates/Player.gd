extends KinematicBody2D

#Variables
export var speed := 100.0
export var jump := 150.0
export var gravity := 10.0
export var friction := 0.2
export var acceleration := 0.5

var moving = true
var _velocity = Vector2.ZERO


#Functions
func _physics_process(delta):
	if moving:
		move()


func _process(delta):
	$Score/Label.text = str("DEATHS : ", Singleton.deaths)


func move():
	#Move velocity
	var direction = 0
	if Input.is_action_pressed("right"):
		direction += 1
	if Input.is_action_pressed("left"):
		direction -= 1
	if direction != 0:
		_velocity.x = lerp(_velocity.x, direction*speed, acceleration)
	else:
		_velocity.x = lerp(_velocity.x, 0, friction)
	
	#Jump velocity
	if Input.is_action_just_pressed("jump"):
		if is_on_floor():
			_velocity.y = -jump
	_velocity.y += gravity
	
	#Apply velocity
	_velocity = move_and_slide(_velocity, Vector2.UP)
