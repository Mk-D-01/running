extends Control


@onready var label_2 = $Label2
var score = GlobalBeings.score

# Called when the node enters the scene tree for the first time.
func _ready():
	print(score)
	$LeaderboardUI.hide()
	var name = str(int(randf_range(0,9999)) )

	print(name)
	label_2.text = "Score " + str(score)
	Leaderboards.post_guest_score("runnin-scanmu-t5nf",score,name)


func _input(event):
	if Input.is_action_just_pressed("jump"):
		print('refresh')
		get_tree().reload_current_scene()


func _on_button_pressed():
	$LeaderboardUI.show()
