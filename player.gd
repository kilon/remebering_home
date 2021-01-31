extends KinematicBody
class_name Player

export var speed  = 2
export var acceleration = 3
export var gravity = 1
export var jump_power = 10 
export var mouse_sensitivity = 0.3
export var mouse_is_captured = false

onready var head = $RotationHelper
onready var camera = $RotationHelper/Camera
onready var audio_footstep_dirt = $AudioFootstepDirt

var velocity = Vector3()

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	mouse_is_captured = true
	
func _input(event):
	if mouse_is_captured:
		if event is InputEventMouseMotion:
			head.rotate_y(deg2rad(-event.relative.x * mouse_sensitivity))
			
			camera.rotation_degrees.x -= event.relative.y * mouse_sensitivity
			camera.rotation_degrees.x = clamp(camera.rotation_degrees.x, -90, 90)
			
	else:
		if event is InputEventMouseButton:
			if event.button_index == BUTTON_LEFT:
				Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
				mouse_is_captured = true
			
	
func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		mouse_is_captured = false
		get_tree().change_scene("title_screen.tscn")
	
	if Input.is_action_just_pressed("ui_accept"):
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		mouse_is_captured = true
	
	if Input.is_action_just_pressed("quit"):
		get_tree().quit()

func _physics_process(delta):
	if mouse_is_captured:
		var head_basis = head.get_global_transform().basis
		
		var direction  = Vector3()
		
		if Input.is_action_pressed("move_forward"):
			direction -= head_basis.z
			if not audio_footstep_dirt.playing:
				audio_footstep_dirt.playing = true
		
		elif Input.is_action_pressed("move_backward"):
			direction += head_basis.z
			
		elif Input.is_action_pressed("move_left"):
			direction -= head_basis.x
		
		elif Input.is_action_pressed("move_right"):
			direction += head_basis.x
		else:
			audio_footstep_dirt.playing = false
		direction = direction.normalized()
		
		velocity = velocity.linear_interpolate(direction * speed, acceleration * delta)
		velocity.y -= gravity 
		
		if Input.is_action_just_pressed("jump") and is_on_floor():
			velocity.y += jump_power 
		
		if Input.is_action_pressed("ui_home"):
			get_tree().reload_current_scene()

		velocity = move_and_slide(velocity, Vector3.UP)
		
func something():
	pass
