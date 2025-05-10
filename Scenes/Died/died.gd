extends Node2D

@onready var label_2 = $Label2
var score = GlobalBeings.score
var name___ = 'd'
# Called when the node enters the scene tree for the first time.
func _ready():
	score = 10
	pass # Replace with function body.
	label_2 = "Score" + str(score)
	await Leaderboards.post_guest_score("runnin-longest-runner-Sfwq",score+10+10,name___)
	$LeaderboardUI.show()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
func _input(event):
	if Input.is_action_just_pressed("jump"):
		get_tree().reload_current_scene()
