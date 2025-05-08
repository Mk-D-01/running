extends Node2D  # Or RigidBody2D if you want physics

@export var main_ball_path_node: NodePath
@export var delay_frames := 90 # How many steps behind it follows

var main_ball

func _ready():
	main_ball = get_node(main_ball_path_node)

func _process(delta):
	if main_ball.path.size() > delay_frames:
		global_position = main_ball.path[main_ball.path.size() - delay_frames]


func _on_area_2d_body_entered(body):
	if body.is_in_group("player"):
		print('red')
		GlobalBeings.emit_signal("red",1) 
