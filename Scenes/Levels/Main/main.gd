extends Node2D
@onready var gm = $aniti_ball
@onready var score = $score
@onready var ball = $Ball
@onready var heart = $heart

@onready var anti_ball = $aniti_ball/Anti_ball
const JUST_BALL = preload("res://Scenes/ball/just_ball.tscn")
func _ready():
	GlobalBeings.connect("multiply",Callable(self,"_multiply"))
	GlobalBeings.connect("dead",Callable(self,"_dead"))
	score.start(0.5)
	heart.start(10)

	
func _multiply():
	for i in range(5):
		var a = JUST_BALL.instantiate()
		a.global_position = anti_ball.global_position
		add_child(a)


func _on_score_timeout():
	ball.up_score(1)
	score.start(0.5)


func _on_d_1_body_entered(body):
	if body.is_in_group('player'):
		print('reset by 1')
		get_tree().reload_current_scene()


func _on_d_4_body_entered(body):
	pass # Replace with function body.
	if body.is_in_group('player'):
		print('reset by 2')
		get_tree().reload_current_scene()


func _on_d_2_body_entered(body):
	if body.is_in_group('player'):
		print('reset by 3')
		get_tree().reload_current_scene()
	pass # Replace with function body.


func _on_d_3_body_entered(body):
	pass # Replace with function body.
	if body.is_in_group('player'):
		print('reset by 4')
		get_tree().reload_current_scene()


func _on_heart_timeout():
	ball.hearts+=5

func _dead():
	GlobalBeings.score = ball.score
	get_tree().change_scene_to_file("res://Scenes/Died/Died.tscn")
