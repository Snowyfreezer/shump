extends Resource

class_name playerStats

@export_range(1, 10, 1, "or_greater") var lives: int = 3
@export_range(1, 10, 1, "or_greater") var bombs: int = 3
@export_range(1, 100, 1, "or_greater", "prefer_slider") var bulletDamage: int = 10
#Bomb or Respawn should trigger invincibility
@export var invincible: bool = false
# Like if you get a shield from an ability maybe ie: Reisen Touhou 15
@export var hitShield: bool = false


signal hitTaken(newlives: int, oldlives: int)

# TODO add a sound for when you get hit
func took_hit() -> bool:
	var old: int = lives
	if !invincible:
		lives -= 1
		hitTaken.emit(lives, old)
		print("Player got hit, PICHUNNNNN")
		return true
	if hitShield && !invincible:
		hitTaken.emit(lives)
		hitShield = false
		print("Player got hit, but they had a shield")
		return true
	return false
 
func add_life(amount: int = 1) -> void:
	lives += amount

func add_bomb(amount: int = 1) -> void:
	bombs += amount

# move this to player later because invincibility is on a timer or something
func bomb_used(amount: int = 1) -> void:
	bombs -= amount
	invincible = true

# Called when the node enters the scene tree for the first time.
# func _ready() -> void:
# 	pass # Replace with function body.


# # Called every frame. 'delta' is the elapsed time since the previous frame.
# func _process(delta: float) -> void:
# 	pass
