extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var show_help_text = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_help_area_input_event(camera, event, click_position, click_normal, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed == true:
			show_help_text = true
	pass # Replace with function body.
