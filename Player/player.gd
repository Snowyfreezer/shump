extends CharacterBody2D


@export var speed: float = 400.0
@export var focusSpeed: float = 200.0

# TODO: make focus circle visible when holding shift

func _physics_process(delta: float) -> void:

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
