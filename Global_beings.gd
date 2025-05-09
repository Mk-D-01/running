extends Node

signal blue
signal red(x)
signal multiply

func _input(event):
	if Input.is_action_just_pressed('exit'):
		get_tree().quit() 
