extends Node

var main_menu_screen = preload("res://ui/main_menu_screen.tscn")
var pause_menu_screen = preload("res://ui/pause_menu_screen.tscn")
 
func _ready():
	RenderingServer.set_default_clear_color(Color(0.46, 0.00, 0.56, 1.00))

	SettingsManager.load_settings()


func start_game():
	if get_tree().paused:
		continue_game()
		return

	SceneManager.transition_to_scene("level1")


func pause_game():
	get_tree().paused = true

	var pause_screen_instance = pause_menu_screen.instantiate()
	get_tree().get_root().add_child(pause_screen_instance)


func exit_game():
	get_tree().quit()


func continue_game():
	get_tree().paused = false


func main_menu():
	var main_menu_instance = main_menu_screen.instantiate()
	get_tree().get_root().add_child(main_menu_instance)
