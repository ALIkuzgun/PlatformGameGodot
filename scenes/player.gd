extends CharacterBody2D

const SPEED = 160.0
const JUMP_VELOCITY = -300.0

@onready var health_bar = $"../CanvasLayer/Healthbar"
@onready var animatedsprite2D = $AnimatedSprite2D
@onready var coin_label = $"../CanvasLayer/CoinLabel"

var coin_counter = 0
var max_health = 100
var current_health = 100
var key_hit = 0

@export var attacking = false

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		$jumpwaw.play()

	var direction := Input.get_axis("left", "right")

	if Input.is_action_pressed("right"):
		$Attackarea.rotation += delta * SPEED
	elif Input.is_action_pressed("left"):
		$Attackarea.rotation -= delta * SPEED
	
	if !attacking:
		if is_on_floor():
			if direction == 0:
				animatedsprite2D.play('idle')
			else:
				animatedsprite2D.play('move')
		else:
			animatedsprite2D.play('jump')

	if direction > 0:
		animatedsprite2D.flip_h = false
	if direction < 0:
		animatedsprite2D.flip_h = true

	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

func attack():
	var over_lapping_objects = $Attackarea.get_overlapping_areas()
	for area in over_lapping_objects:
		var parent = area.get_parent()
		parent.take_damage()
	attacking = true
	animatedsprite2D.play('attack')

func _ready():
	coin_label.position = Vector2(20, 20)
	coin_label.text = "Coin: " + str(coin_counter)
	update_health_bar()

func add_coin():
	coin_counter += 1
	coin_label.text = "Coin: " + str(coin_counter)

func update_health_bar():
	health_bar.value = current_health

func _process(delta: ) -> void:
	if Input.is_action_just_pressed("attack"):
		attack()

func _on_animated_sprite_2d_animation_finished() -> void:
	if attacking == true:
		attacking = false
