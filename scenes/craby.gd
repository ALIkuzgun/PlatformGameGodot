extends Node2D

const  SPEED = 50
var direction = 1

@onready var ray_cast_right = $RayCast2D
@onready var ray_cast_left = $RayCast2D2
@onready var animated_sprite_2D = $AnimatedSprite2D
@onready var player_attack = $Attack
@onready var health_bar = $Crabyhealth
@onready var timer = $Crabytimer

var current_health = 100

func _process(delta):
	if ray_cast_left.is_colliding():
		direction = 1
		animated_sprite_2D.flip_h = true
	if ray_cast_right.is_colliding():
		direction = -1
		animated_sprite_2D.flip_h = false
	position.x += SPEED * direction * delta 
 
	if current_health <= 0:
		queue_free()

func take_damage():
	$Damage.play()
	current_health -= 30
	health_bar.value = current_health
