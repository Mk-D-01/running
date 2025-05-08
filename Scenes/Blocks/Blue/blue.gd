extends Node2D
@onready var timer = $Timer


func _on_detect_player_body_entered(body):
	if body.is_in_group("player"):
		timer.start(1.5)
		
	

func _on_timer_timeout():
	GlobalBeings.emit_signal("blue")
	$".".queue_free()
