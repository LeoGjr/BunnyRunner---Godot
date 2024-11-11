extends Node

var pre_golden_carrots = preload("res://scenes/golden_carrots.tscn")
var golden_carrots
var prize_carrots = [
	{
		average = .5,
		prize = 1
	},
	{
		average = .8,
		prize = 2
	},
	{
		average = 1,
		prize = 3
	}
]

enum {MENU, LOADING, LOADED}
var current_stage_name
var current_music
var status = MENU
var current_stage
var loaded_stage
var ref_stage
var stage_coins
func _ready():
	add_to_group("game")
	$HUD2/estage_exit.hide()
	pass

func stage_selected(button):
	if status == MENU:
		status = LOADING
		current_stage = button.stage
		current_music = button.music
		current_stage_name = button.stage_name
		$HUD.hide()
		load_stage()
		$HUD2/controls.show()
		$HUD2/estage_exit.show()
		status = LOADED
	
	
func load_stage():
	stage_coins = 0
	$HUD2/controls/coin_counter.coins = 0
	if loaded_stage != null && ref_stage.get_ref() != null:
		loaded_stage.queue_free()
	loaded_stage = load(current_stage).instance()
	if current_music:
		$music.stream = load(current_music)
	ref_stage = weakref(loaded_stage)
	add_child(loaded_stage)
	$HUD2/count_down/anim.play("count")
	yield($HUD2/count_down/anim, "animation_finished")
	get_tree().call_group("player", "start")
	play_music()
	
func player_died():
	load_stage()
	stop_music()
	
func player_victory():
	stop_music()
	$stream_victory.play()
	var average = (float($HUD2/controls/coin_counter.coins) / float(stage_coins))
	var prize = 0
	for pc in prize_carrots:
		if average >= pc.average:
			prize = pc.prize
			
	GAME_DATA.save_prize(current_stage_name, prize)
	golden_carrots = pre_golden_carrots.instance()
	$HUD2.add_child(golden_carrots)
	golden_carrots.play(prize)
	yield(golden_carrots, "carrots_finished")
	var t = get_tree().create_timer(4)
	yield(t, "timeout")
	exit_stage()

func _on_estage_exit_pressed():
	exit_stage()

func exit_stage():
	stop_music()
	loaded_stage.queue_free()
	$HUD.show()
	$HUD2/controls.hide()
	$HUD2/estage_exit.hide()
	$HUD2/count_down.hide()
	status = MENU
	if golden_carrots != null and weakref(golden_carrots):
		golden_carrots.queue_free()
	
func play_music():
	if current_music:
		$music.play()
		
func stop_music():
	$music.stop()
func player_dying():
	stop_music()
	
	
func add_stage_coins():
	stage_coins += 1