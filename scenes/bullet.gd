extends Area2D

@onready var player = $Player
var speed = 200

func _ready() -> void:
	set_as_top_level(true)

func _process(delta: float) -> void:
	position -= (Vector2.RIGHT*speed).rotated(rotation)*delta

func _on_visible_on_screen_enabler_2d_screen_exited() -> void:
	queue_free()

func _on_body_entered(body: Node2D) -> void:
	body.current_health -= 40
	body.update_health_bar()
	if body.current_health <= 0:
		body.get_node('CollisionShape2D').queue_free()
		get_tree().reload_current_scene()
	queue_free()
