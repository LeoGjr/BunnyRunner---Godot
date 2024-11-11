extends Node2D

onready var size = $bar.rect_size

func _ready():
	hide()
	add_to_group("power_up_bar")
	pass
func start(time):
	show()
	$Tween.interpolate_method(self, "count", 1, 0, time, Tween.TRANS_LINEAR, Tween.EASE_IN, 0)
	$Tween.start()
	pass
	
	
func stop():
	$Tween.stop_all()
	hide()
	
func count(val):
	$bar.rect_size = Vector2(size.x * val, size.y)

func _on_Tween_tween_completed(object, key):
	stop()
	get_tree().call_group("player", "poweup_complete")
