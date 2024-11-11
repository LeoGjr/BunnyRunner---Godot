extends Area2D

func _ready():
	pass


func _on_coil_body_entered(body):
	$sprite.play("action")
	$action.play()
	body.jump(1500, false)
