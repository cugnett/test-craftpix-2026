extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta * 1.5

	# Handle jump.
	if (Input.is_action_just_pressed("jump_1") \
	or Input.is_action_just_pressed("jump_2") \
	or Input.is_action_just_pressed("jump_3")) \
	and is_on_wall():
		velocity.y = JUMP_VELOCITY

	move_and_slide()
