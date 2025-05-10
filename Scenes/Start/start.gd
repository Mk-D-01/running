extends Node2D

@onready var line_edit = $Label2/LineEdit
@onready var label = $Label2/Label

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_line_edit_text_submitted(new_text):
	label.text = new_text
