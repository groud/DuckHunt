extends Node

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

func _process(delta):
	$Crosshair.global_position = get_viewport().get_mouse_position()
	$"RiflePivot/rifle".position.x = range_lerp($Crosshair.global_position.x, 0, get_viewport().size.x, -100, 100)
	$"RiflePivot/rifle".position.y = range_lerp($Crosshair.global_position.y, 0, get_viewport().size.y, -100, 100)
	
func _input(event):
	if event.is_action_pressed("fire"):
		shoot()
		
func shoot():
	$AnimationPlayer.stop()
	$AnimationPlayer.play("fire")
	if (!$Crosshair/Area2D.get_overlapping_areas().empty()):
		$Crosshair/Area2D.get_overlapping_areas().front().shot($Crosshair.global_position)