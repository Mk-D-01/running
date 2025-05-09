extends RigidBody2D

func _ready():
	randomize()
	apply_random_impulse()

func apply_random_impulse():
	var direction = randf_range(-1, 1)
	var strength = 300
	apply_impulse(Vector2.ZERO, Vector2(200, -100))
	
func _physics_process(delta):
	var direction = Vector2(randf_range(-1, 1), randf_range(-1, 1)).normalized()
	apply_impulse(Vector2(0, randf_range(-1,1)*100))


func _on_area_2d_body_entered(body):
	if body.is_in_group("player"):
		GlobalBeings.emit_signal("red",10)
