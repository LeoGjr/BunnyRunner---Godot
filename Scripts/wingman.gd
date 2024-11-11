extends Node2D

func _ready():
	pass


func _on_head_body_entered(body):
	$body.collision_mask = 0
	body.jump(800, false)
	$hurt.play()
	$anim.play("destroy")
	yield($anim, "animation_finished")
	queue_free()


func _on_body_body_entered(body):
	body.killed()
