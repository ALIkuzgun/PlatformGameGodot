extends Area2D

@onready var player = $"../../Player"
@onready var timer = $CoinTimer
@onready var audio = $AudioStreamPlayer2D

func _on_body_entered(body: Node2D) -> void:
	if body == player:
		player.add_coin()
		print("coin +1")
		audio.play()
		timer.start() 

func _on_coin_timer_timeout() -> void:
	queue_free()
