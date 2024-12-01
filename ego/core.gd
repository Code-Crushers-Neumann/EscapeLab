# This is the core singleton of your game, that holds
# key functions required to run the game
extends Node


# Initialize, configure the game and connect required
# signals
func _ready():
	_initialization()
	EgoVenture.configure(preload("res://configuration.tres"))
	MainMenu.connect("new_game", self, "_on_new_game")
	Inventory.connect("triggered_inventory_item", self, "_on_triggered_inventory_item")
	EgoVenture.connect("game_loaded", self, "_on_load")


# Triggered when an inventory item was used on another
#
# ** Parameters **
#
# - item1: First item
# - item2: Second item
func _on_triggered_inventory_item(item1: InventoryItem, item2: InventoryItem):
	match item1.title:
		"Szám":
			if item2.title == "Kódolt Üzenet":
				Inventory.remove_item(preload("res://inventory/level_easy_coded_message.tres"))
				Inventory.remove_item(preload("res://inventory/level_easy_number_note.tres"))
				Parrot.play(preload("res://dialogs/level_easy_items_combined.tres"))
				(EgoVenture.state as GameState).easy_flag = true
	match item1.title:
		"Kódolt Üzenet":
			if item2.title == "Szám":
				Inventory.remove_item(preload("res://inventory/level_easy_coded_message.tres"))
				Inventory.remove_item(preload("res://inventory/level_easy_number_note.tres"))
				Parrot.play(preload("res://dialogs/level_easy_items_combined.tres"))
				(EgoVenture.state as GameState).easy_flag = true
	
	match item1.title:
		"Lyukas papír":
			if item2.title == "Tanulmányi lap":
				Inventory.remove_item(preload("res://inventory/level_medium_research.tres"))
				Inventory.remove_item(preload("res://inventory/level_medium_cutout.tres"))
				Parrot.play(preload("res://dialogs/level_medium_combineforgyufa.tres"))
				(EgoVenture.state as GameState).medium_can_gyufa = true
	match item1.title:
		"Tanulmányi lap":
			if item2.title == "Lyukas papír":
				Inventory.remove_item(preload("res://inventory/level_medium_research.tres"))
				Inventory.remove_item(preload("res://inventory/level_medium_cutout.tres"))
				Parrot.play(preload("res://dialogs/level_medium_combineforgyufa.tres"))
				(EgoVenture.state as GameState).medium_can_gyufa = true
	
	match item1.title:
		"Nato kód könyv":
			if item2.title == "Kódolt papír":
#				Inventory.remove_item(preload("res://inventory/level_easy_coded_message.tres"))
#				Inventory.remove_item(preload("res://inventory/level_easy_number_note.tres"))
#				Parrot.play(preload("res://dialogs/level_easy_items_combined.tres"))
#				(EgoVenture.state as GameState).easy_flag = true
				pass
	match item1.title:
		"Kódolt papír":
			if item2.title == "Nato kód könyv":
#				Inventory.remove_item(preload("res://inventory/level_easy_coded_message.tres"))
#				Inventory.remove_item(preload("res://inventory/level_easy_number_note.tres"))
#				Parrot.play(preload("res://dialogs/level_easy_items_combined.tres"))
#				(EgoVenture.state as GameState).easy_flag = true
				pass


# Triggered when a new game is started.
func _on_new_game():
	_initialization()
	EgoVenture.change_scene("res://scenes/level_tutorial/intro.tscn")
	# Should call an introduction sequence
	#EgoVenture.change_scene("res://scenes/intro.tscn")


# Initialize the game state
func _initialization():
	var state = GameState.new()
	EgoVenture.state = state


# Triggered when a save game is loaded	
func _on_load():
	pass
