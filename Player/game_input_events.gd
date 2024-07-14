class_name GameInputEvents
extends Node


static func movement_input() -> float:
	var direction: float = Input.get_axis("move_left", "move_right")
	return direction


static func jump_input() -> bool:
	var jump_input_pressed: bool = Input.is_action_just_pressed("jump")
	return jump_input_pressed


static func shoot_input() -> bool:
	var shoot_input_pressed: bool = Input.is_action_just_pressed("shoot")
	return shoot_input_pressed


static func shoot_up_input() -> bool:
	var shoot_input_pressed: bool = Input.is_action_just_pressed("shoot")
	var up_input: bool = Input.is_action_just_pressed("look_up")
	return up_input and shoot_input_pressed
