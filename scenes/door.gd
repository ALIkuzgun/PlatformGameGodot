extends Area2D

@onready var player = $"../../Player"
@onready var animatedsprite2D = $AnimatedSprite2D

func _on_body_entered(body: Node2D) -> void:
	if body == player:
		if player.key_hit == 1:
			get_tree().change_scene_to_file("res://scenes/gameending.tscn")

func _process(delta: ) -> void:
	if player.key_hit == 1:
		animatedsprite2D.play('open')
	if player.key_hit == 0:
		animatedsprite2D.play('close')
