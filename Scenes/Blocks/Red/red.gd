extends Node2D

@onready var red = $"."

func _on_area_2d_body_entered(body):
	if body.is_in_group("just_ball"):
		red.queue_free()
