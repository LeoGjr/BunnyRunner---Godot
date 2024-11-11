extends Area2D

func _ready():
	pass


func _on_carrot_body_entered(body):
	body.victory()
