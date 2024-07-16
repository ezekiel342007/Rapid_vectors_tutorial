extends NodeState

@export var character_body_2d: CharacterBody2D
@export var animated_sprite_2d: AnimatedSprite2D
@onready var bullet = preload("res://Player/bullet.tscn")

func on_process(delta: float):
	pass
	
func on_physics_process(delta: float):
	pass

func enter():
	animated_sprite_2d.play("shoot")
	
func exit():
	animated_sprite_2d.stop()

