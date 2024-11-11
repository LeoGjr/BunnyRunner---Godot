tool
extends Area2D


var textures = [
	"res://bunnyrunner_files/sprites/Environment/spikes_bottom.png",
	"res://bunnyrunner_files/sprites/Environment/spikes_top.png"
]

export(int, "TOP", "BOTTOM") var texture = 0 setget set_texture
func _ready():
	pass

func _draw():
	$Sprite.texture = load(textures[texture])


func set_texture(val):
	texture = val
	if is_inside_tree() and Engine.editor_hint:
		update()

func _on_spikes_body_entered(body):
	body.killed()
