extends Area2D

@onready var player = $"../../Player"

func _on_body_entered(body: Node2D) -> void:
	if body == player:
		player.key_hit = 1
		$AudioStreamPlayer2D.play()
		$Timer.start() 

func _on_timer_timeout() -> void:
		queue_free()
