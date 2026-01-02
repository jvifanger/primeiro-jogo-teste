extends Node

var starting_area = 1
var current_area = 1
var area_path = "res://Assets/Scenes/Areas/"

var energy_cells = 0
var lives = 3
var area_container : Node2D
var player : PlayerController
var hud : HUD

func _ready():
	hud = get_tree().get_first_node_in_group("hud")
	area_container = get_tree().get_first_node_in_group("area_container")
	player = get_tree().get_first_node_in_group("player")
	load_area(starting_area)

func decrease_health():
	lives -= 1
	print(lives)
	if (lives == 0):
		get_tree().reload_current_scene()

func next_area():
	current_area +=1
	load_area(current_area)

func load_area(area_number):
	#Checking the new scene path
	var full_path = area_path + "area_" + str(current_area) + ".tscn"
	var scene = load(full_path) as PackedScene
	if !scene:
		return
	#removing the previous scene
	for child in area_container.get_children():
		child.queue_free()
		await child.tree_exited
	#Setting up the new scene
	var instance = scene.instantiate()
	area_container.add_child(instance)
	reset_energy_cells()
	#Moving the player to the start positon of the new scene
	var player_start_position = get_tree().get_first_node_in_group("player_start_position") as Node2D
	player.teleport_to_location(player_start_position.position)

func add_energy_cell():
	energy_cells += 1
	hud.update_energy_cell_label(energy_cells)
	if energy_cells >= 4:
		var portal = get_tree().get_first_node_in_group("area_exits") as AreaExit
		portal.open()
		hud.portal_opened()

func reset_energy_cells():
	energy_cells = 0
	hud.update_energy_cell_label(energy_cells)
	hud.portal_closed()
