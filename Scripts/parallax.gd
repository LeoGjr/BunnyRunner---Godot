tool
extends ParallaxBackground

export(Color) var modulate_l1 = Color(1,1,1,1) setget set_modulate_l1
export(Color) var modulate_l2 = Color(1,1,1,1) setget set_modulate_l2
export(Color) var modulate_l3 = Color(1,1,1,1) setget set_modulate_l3
export(Color) var modulate_l4 = Color(1,1,1,1) setget set_modulate_l4

func _ready():
	pass



func set_modulate_l1(val):
	modulate_l1 = val
	if is_inside_tree() && Engine.editor_hint:
		set_colors()
		
func set_modulate_l2(val):
	modulate_l2 = val
	if is_inside_tree() && Engine.editor_hint:
		set_colors()
func set_modulate_l3(val):
	modulate_l3 = val
	if is_inside_tree() && Engine.editor_hint:
		set_colors()
func set_modulate_l4(val):
	modulate_l4 = val
	if is_inside_tree() && Engine.editor_hint:
		set_colors()
		
		
		
func set_colors():
	$layer1/bg_layer1.modulate = modulate_l1
	$layer2/bg_layer1.modulate = modulate_l2
	$layer3/bg_layer1.modulate = modulate_l3
	$layer4/bg_layer1.modulate = modulate_l4
