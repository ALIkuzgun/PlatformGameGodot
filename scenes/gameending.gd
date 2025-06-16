extends Control

func _ready():
	$Button.pressed.connect(_on_button_pressed)

func _on_button_pressed() -> void:
	get_tree().quit()
