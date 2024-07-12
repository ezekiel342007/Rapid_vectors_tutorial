extends Node

var scenes: Dictionary = {
	"level1": "res://levels/level_1.tscn",
	"level2": "res://levels/level_2.tscn"
}

@onready var scene_transition_screen = preload("res://ui/Screen_transition/scene_transition_screen.tscn")

func transition_to_scene(level: String):
	var scene_path: String = scenes.get(level)

	if scene_path != null:
		var scene_transition_screen_instance = scene_transition_screen.instantiate()
		get_tree().get_root().add_child(scene_transition_screen_instance)
		await get_tree().create_timer(5.0).timeout
		get_tree().change_scene_to_file(scene_path)
		scene_transition_screen_instance.queue_free()
