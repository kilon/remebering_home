extends Panel


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var help_text = $"../title_screen/help_text_object"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


	
	
func _process(delta):
	visible = help_text.show_help_text
	
func _input(event):
	if event.is_action_pressed("ui_cancel"):
		print("make text invisible")
		help_text.show_help_text = false
		print(visible)	

