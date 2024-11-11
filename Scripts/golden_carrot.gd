extends Node2D

signal finished

func _ready():
	pass
func play():
	$anim.play("fadein")
	yield($anim, "animation_finished")
	emit_signal("finished")