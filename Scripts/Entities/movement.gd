extends CharacterBody2D

const SPEED:float = 300.0
const JUMP_VELOCITY:float = -250.0
const gravity:float = 700.0

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	velocity.x = 0;
	if Input.is_key_pressed(KEY_LEFT):
		velocity.x -= SPEED
	if Input.is_key_pressed(KEY_RIGHT):
		velocity.x += SPEED
		
	if is_on_floor() and Input.is_key_pressed(KEY_SPACE):
			velocity.y += JUMP_VELOCITY
	
	move_and_slide()
	
	if(global_position.y > 100.0):
		game_over()

func game_over():
	get_tree().reload_current_scene()
