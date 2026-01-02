extends CharacterBody2D
class_name EnemyController

@export var speed = 10.0
@export var jump_power = 10.0
@export var gravity = 10

var speed_multiplier = 30.0
var jump_multiplier = -30.0
var direction = 0
var is_moving_right = true


func _process(_delta):
	move_character()
	detect_turn_around()

func move_character():
	if is_moving_right:
		velocity.x = speed * speed_multiplier
	else:
		velocity.x = -speed * speed_multiplier
	velocity.y += gravity
	move_and_slide()

func detect_turn_around():
	if not $RayCast2D.is_colliding() and is_on_floor():
		is_moving_right = !is_moving_right
		scale.x = -scale.x



func _on_area_2d_body_entered(body):
	if (body.name == "Player"):
		var y_delta = position.y - body.position.y
		if(y_delta > 3):
			print("Destroy Enemy")
			queue_free()
			body.jump()
		else:
			print("Player loses health")
			body.queue_free()
		
