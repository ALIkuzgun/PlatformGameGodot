extends Area2D

@onready var player = $Player

func _on_body_entered(body: Node2D) -> void:
	body.current_health -= 20
	$Damage.play()
	body.update_health_bar()
	if body.current_health <= 0:
		body.get_node('CollisionShape2D').queue_free()
		get_tree().reload_current_scene()
