extends Node2D

var bullet = preload("res://scenes/bullet.tscn")

func _ready():
	$Timer.start()

func shoot() -> void:
	var bullet_instance = bullet.instantiate()
	bullet_instance.rotation = $Marker2D.rotation
	bullet_instance.global_position = $Marker2D.global_position
	add_child(bullet_instance)

func _on_timer_timeout() -> void:
	shoot()
