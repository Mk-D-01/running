extends Node2D
@onready var gm = $aniti_ball

@onready var anti_ball = $aniti_ball/Anti_ball
const JUST_BALL = preload("res://Scenes/ball/just_ball.tscn")
func _ready():
	GlobalBeings.connect("multiply",Callable(self,"_multiply"))
	
func _multiply():
	var a = JUST_BALL.instantiate()
	a.global_position = anti_ball.global_position
	add_child(a)
