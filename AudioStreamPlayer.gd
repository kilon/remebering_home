extends AudioStreamPlayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	playing = true
	volume_db = -80
	pass # Replace with function body.

func _process(delta):
	if volume_db < 0:
		volume_db += 0.2
	if not playing:
			playing = true
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
