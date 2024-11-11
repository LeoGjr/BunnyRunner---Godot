tool
extends StaticBody2D

var textures = [
	"res://bunnyrunner_files/sprites/Environment/ground_grass.png",
	"res://bunnyrunner_files/sprites/Environment/ground_sand.png",
	"res://bunnyrunner_files/sprites/Environment/ground_snow.png",
	"res://bunnyrunner_files/sprites/Environment/ground_stone.png",
	"res://bunnyrunner_files/sprites/Environment/ground_wood.png"
]

export(int, "GRASS", "SAND", "SNOW", "STONE", "WOOD") var texture = 0 setget set_texture

func _ready():
	pass
	
	
func _draw():
	$sprite.texture = load(textures[texture])


func set_texture(val):
	texture = val
	if is_inside_tree() && Engine.editor_hint:
		update()