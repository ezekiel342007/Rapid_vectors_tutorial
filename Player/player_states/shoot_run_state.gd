extends NodeState

@export var character_body_2d: CharacterBody2D
@export var animated_sprite_2d: AnimatedSprite2D
@export var muzzle: Marker2D

@export_category("Run State")
@export var speed: int = 1000
@export var max_horizontal_speed: int = 300

var bullet = preload("res://Player/bullet.tscn")
var muzzle_position: Vector2


func on_process(_delta: float) -> void:
	pass

	
func on_physics_process(_delta: float) -> void:
	var direction: float = GameInputEvents.movement_input()
	position_muzzle(direction)

	if direction:
		character_body_2d.velocity.x += direction * speed
		character_body_2d.velocity.x = clamp(character_body_2d.velocity.x, -max_horizontal_speed, max_horizontal_speed)

	if direction != 0:
		animated_sprite_2d.flip_h = true if direction < 0 else false

	if GameInputEvents.shoot_input():
		gun_shooting(direction)

	character_body_2d.move_and_slide()

	# Transitioning states

	# Fall state
	if !character_body_2d.is_on_floor():
		transition.emit("Fall")

	# Jump state
	if GameInputEvents.jump_input():
		transition.emit("Jump")

	# Idle state
	if direction == 0:
		transition.emit("Idle")


func enter() -> void:
	muzzle.position = Vector2(19, -27)
	muzzle_position = muzzle.position

	animated_sprite_2d.play("run_and_shoot")
	

func exit() -> void:
	animated_sprite_2d.stop()


func position_muzzle(direction: float) -> void:
	if direction > 0:
		muzzle.position.x = muzzle_position.x
	elif direction < 0:
		muzzle.position.x = -muzzle_position.x


func gun_shooting(direction: float) -> void:
	var bullet_instance = bullet.instantiate() as Node2D
	bullet_instance.direction = direction
	bullet_instance.move_x_direction = true
	bullet_instance.global_position = muzzle.global_position
	get_parent().add_child(bullet_instance)
