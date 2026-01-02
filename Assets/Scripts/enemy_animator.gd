extends Node2D

@export var enemy_controller : EnemyController
@export var animation_player : AnimationPlayer
@export var sprite : Sprite2D

func _process(delta):
	if abs(enemy_controller.velocity.x) > 0.0:
		animation_player.play("move")
	else:
		animation_player.play("idle")
