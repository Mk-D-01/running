extends RigidBody2D

@export var move_force := 500.0
@export var jump_impulse := -50
@export var max_path_length := 200

@onready var cam = $Camera2D
@onready var cam_t = $camera_shift
@onready var label = $Controls/Label
@onready var ball = $"."
@onready var jump_timer = $jump_timer

@onready var controls = $Controls

# Mobile Controls
var j := false
var l := false
var r := false


var hearts = 5
var path := []
var score = 0
var jump := false

func _ready():
	jump = true
	GlobalBeings.connect("blue",Callable(self,"_on_blue"))
	GlobalBeings.connect("red",Callable(self,"_hit"))
	
	score = 0
	
func _physics_process(delta):
	# Move left/right
	var direction = 0.0
	if Input.is_action_pressed("ui_left") or Input.is_action_pressed("left") or l:
		direction -= 1
	if Input.is_action_pressed("ui_right") or Input.is_action_pressed("right") or r:
		direction += 1

	if direction != 0:
		apply_force(Vector2(direction * move_force, 0))

	# Jump
	if Input.is_action_pressed("jump") or j:
		if jump :
			apply_impulse(Vector2(0, jump_impulse))
		else : 
			jump_timer.start(10)
	if Input.is_action_pressed("sh"):
		angular_velocity *= 0.93
	if Input.is_action_just_pressed("sc"):
		up_score(1)
		
func up_score(x:int):
	score+= x
	label.text = 'Score : ' + str(score) + ' Heart : ' + str(hearts)
	
func _process(delta):
	if hearts <= 0:
		GlobalBeings.emit_signal("dead")
		
	path.append(global_position)
	if path.size() > max_path_length:
		path.pop_front()
	
	label.global_position  = ball.global_position +  Vector2(200.0,-292.0)
	label.rotation = 0
	controls.global_position = (ball.global_position)
	controls.global_rotation = 0
	cam.global_rotation = 0


func _on_blue():
	up_score(10)


func _on_jump_timer_timeout():
	jump = true
	
func _hit(x):
	hearts -= x
	score -= 5
	label.text = 'Score : ' + str(score) + ' Heart : ' + str(hearts)


# Mobile Jump
func _on_j_pressed():
	j = true

func _on_j_released():
	j = false
	


func _on_l_pressed():
	l = true


func _on_l_released():
	l = false
	print("l")

func _on_r_pressed():
	r = true


func _on_r_released():
	r = false
