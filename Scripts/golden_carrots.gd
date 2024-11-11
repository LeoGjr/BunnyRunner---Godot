extends Node2D

signal carrots_finished

func _ready():
	pass
func play(carrots):
	carrots = clamp(carrots, 0, 3)
	for c in range(carrots):
		var carot = get_child(c)
		carot.play()
		yield(carot, "finished")
	emit_signal("carrots_finished")