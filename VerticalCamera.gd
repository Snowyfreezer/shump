extends Camera2D

# Camera scroll up, vertical shump go brrrr
func _physics_process(_delta):
	var camera_speed = 2
	self.position.y -= camera_speed


# Called when the node enters the scene tree for the first time.
# func _ready() -> void:
# 	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
# func _process(delta: float) -> void:
# 	pass
