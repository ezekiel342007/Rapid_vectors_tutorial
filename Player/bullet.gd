extends AnimatedSprite2D


var speed: int = 600
var direction: int

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float):
	move_local_x(direction * speed * delta)


func _on_timer_timeout():
	queue_free()
