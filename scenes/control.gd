extends Control

func _ready():
	$VBoxContainer/Button1.pressed.connect(_on_button_1_pressed)
	$VBoxContainer/Button3.pressed.connect(_on_button_3_pressed)

func _on_button_1_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/game.tscn")

func _on_button_3_pressed() -> void:
	get_tree().quit()
