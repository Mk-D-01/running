extends Node2D
@onready var gm = $aniti_ball
@onready var score = $score
@onready var ball = $Ball

@onready var anti_ball = $aniti_ball/Anti_ball
const JUST_BALL = preload("res://Scenes/ball/just_ball.tscn")
func _ready():
	GlobalBeings.connect("multiply",Callable(self,"_multiply"))
	score.start(0.5)
	
func _multiply():
	for i in range(5):
		var a = JUST_BALL.instantiate()
		a.global_position = anti_ball.global_position
		add_child(a)


func _on_score_timeout():
	ball.up_score(1)
	score.start(0.5)
