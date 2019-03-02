extends Node2D

var speed = 200
var direction = 1

func _process(delta):
	position.x += speed*direction*delta
	if (position.x > get_viewport().size.x + 100):
		direction = -1
	if (position.x < -100):
		direction = 1
	$duck_outline_target_brown.scale.x = direction

func shot(var p_global_position):
	$AnimationPlayer.play("shot")
	$Respawn.start()

func _on_Respawn_timeout():
	$AnimationPlayer.play("respawn")
