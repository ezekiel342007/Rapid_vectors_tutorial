extends Node2D

@onready var label = $GoldCoinLabel
@onready var animated_sprite_2d = $AnimatedSprite2D

var award_amount: int = 10

func _ready():
	label.hide()

func _on_area_2d_body_entered(body):
	# if body.is_in_group("Player"):
	# 	print("coid collected")

	CollectibleManager.give_collectible_award(award_amount)

	animated_sprite_2d.hide()
	label.text = "%s" % award_amount

	label.show()

	var tween = get_tree().create_tween()
	tween.tween_property(label, "position", Vector2(label.position.x, label.position.y + -10), 0.5).from_current()
	tween.tween_callback(queue_free)
