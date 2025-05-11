extends Node2D

@onready var label_2 = $Label2
var score = GlobalBeings.score
var name___ = 'd'
# Called when the node enters the scene tree for the first time.
func _ready():
	
	
	score = int(randf_range(1,10))
	print(score)
	var name = str(int(randf_range(0,9999)) )
	$Timer.start(0.5)
	pass # Replace with function body.
	label_2.text = "Score " + str(score)
	await Leaderboards.post_guest_score("runnin-longest-runner-Sfwq",score,name)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
func _input(event):
	if Input.is_action_just_pressed("jump"):
		print('refresh')
		get_tree().reload_current_scene()


func _on_timer_timeout():
	pass
	pass # Replace with function body.
