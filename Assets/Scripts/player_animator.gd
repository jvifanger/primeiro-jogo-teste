extends Node2D

@export var player_controller : PlayerController
@export var animation_player : AnimationPlayer
@export var sprite : Sprite2D

func _process(delta):
	#Vira o lado do personagem
	if player_controller.direction == 1: 
		sprite.flip_h = false
	elif  player_controller.direction == -1:
		sprite.flip_h = true
	#executa a animação do player
	if abs(player_controller.velocity.x) > 0.0:
		animation_player.play("Move")
	else:
		animation_player.play("idle")
	#excuta a animação de pulo
	if player_controller.velocity.y < 0.0:
		animation_player.play("jump")
	if player_controller.velocity.y > 0.0:
		animation_player.play("fall")
	
	
