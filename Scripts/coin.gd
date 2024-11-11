extends Area2D

func _ready():
	get_tree().call_group("game", "add_stage_coins")
	pass


func _on_coin_body_entered(body):
	$fx.play()
	$sprite.visible = false
	collision_mask = 0
	$queue_timer.start()
	$particles.emitting = true
	get_tree().call_group("coin_counter", "pick_coin")


func _on_queue_timer_timeout():
	queue_free()
