extends CharacterBody2D


@export var speed: float = 300.0
@export var focusSpeed: float = 150.0
# const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	# if not is_on_floor():
	# 	velocity += get_gravity() * delta
	# Handle jump.
	# if Input.is_action_just_pressed("ui_accept") and is_on_floor():
	# 	velocity.y = JUMP_VELOCITY
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var directionX := Input.get_axis("left", "right")
	if directionX:
		if Input.is_action_pressed("focus"):
			velocity.x = directionX * focusSpeed
		else:
			velocity.x = directionX * speed
	else:
		if Input.is_action_pressed("focus"):
			velocity.x = move_toward(velocity.x, 0, focusSpeed)
		else:
			velocity.x = move_toward(velocity.x, 0, speed)

	var directionY := Input.get_axis("up", "down")
	if directionY:
		if Input.is_action_pressed("focus"):
			velocity.y = directionY * focusSpeed
		else:			
			velocity.y = directionY * speed
	else:
		if Input.is_action_pressed("focus"):
			velocity.y = move_toward(velocity.y, 0, focusSpeed)
		else:
			velocity.y = move_toward(velocity.y, 0, speed)
			
	move_and_slide()
