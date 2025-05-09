extends RigidBody2D

@export var move_force := 500.0
@export var jump_impulse := -50
@export var max_path_length := 200

@onready var cam = $Camera2D
@onready var cam_t = $camera_shift
@onready var label = $Label
@onready var ball = $"."
@onready var jump_timer = $jump_timer

@onready var controls = $Controls

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
	if Input.is_action_pressed("ui_left") or Input.is_action_pressed("left"):
		direction -= 1
	if Input.is_action_pressed("ui_right") or Input.is_action_pressed("right"):
		direction += 1

	if direction != 0:
		apply_force(Vector2(direction * move_force, 0))

	# Jump
	if Input.is_action_pressed("jump"):
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
	path.append(global_position)
	if path.size() > max_path_length:
		path.pop_front()
	
	label.global_position  = ball.global_position +  Vector2(282.0,-292.0)
	label.rotation_degrees = 0
	controls.global_position = (ball.global_position)
	controls.global_rotation = 0
	cam.global_rotation = 0


func _on_blue():
	up_score(10)


func _on_jump_timer_timeout():
	jump = true
	
func _hit(x):
	hearts -= x
	label.text = 'Score : ' + str(score) + ' Heart : ' + str(hearts)
