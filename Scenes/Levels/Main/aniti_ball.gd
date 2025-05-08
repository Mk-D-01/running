extends Node2D

const anti_ball = preload("res://Scenes/ball/anti_ball.tscn")
@onready var spawn = $spawn

func _ready():
	spawn.start(0.1)
