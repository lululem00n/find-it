extends CharacterBody2D

const SPEED = 110.0
const JUMP_VELOCITY = -250.0

var respawn_position: Vector2

@onready var anim = $AnimatedSprite2D

func _ready():
	respawn_position = global_position

func _physics_process(delta):
	# Gravedad
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Salto
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Movimiento
	var direction := Input.get_axis("move_left", "move_right")
	velocity.x = direction * SPEED

	# Animaciones
	if not is_on_floor():
		anim.stop()
		anim.frame = 0

	elif direction != 0:
		anim.play("default")

		if direction > 0:
			anim.flip_h = false
		else:
			anim.flip_h = true

	else:
		anim.stop()
		anim.frame = 0

	move_and_slide()

func respawn():
	global_position = respawn_position
	velocity = Vector2.ZERO
