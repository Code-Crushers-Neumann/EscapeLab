extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	if((EgoVenture.state as GameState).medium_has_research):
		get_node("Research").visible = false
		get_node("ResearchHotspot").visible = false
		get_node("ResearchHotspot").disabled = true
	if((EgoVenture.state as GameState).medium_has_cutout):
		get_node("Cutout").visible = false
		get_node("CutoutHotspot").visible = false
		get_node("CutoutHotspot").disabled = true
	if((EgoVenture.state as GameState).medium_has_natomessage):
		get_node("NatoMessage").visible = false
		get_node("NatoMessageHotspot").visible = false
		get_node("NatoMessageHotspot").disabled = true
	if((EgoVenture.state as GameState).medium_has_natobook):
		get_node("NatoBook").visible = false
		get_node("NatoBookHotspot").visible = false
		get_node("NatoBookHotspot").disabled = true
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if((EgoVenture.state as GameState).medium_can_labtorlo && !(EgoVenture.state as GameState).medium_has_key):
		get_node("Hotspot").visible = true
		get_node("Hotspot").disabled = false
	if((EgoVenture.state as GameState).medium_has_key):
		get_node("Hotspot").visible = false
		get_node("Hotspot").disabled = true


func _on_ResearchHotspot_activate():
	Boombox.play_effect(preload("res://sounds/item_pickup.mp3"))
	get_node("Research").visible = false
	get_node("ResearchHotspot").visible = false
	get_node("ResearchHotspot").disabled = true
	(EgoVenture.state as GameState).medium_has_research = true
	Inventory.add_item(preload("res://inventory/level_medium_research.tres"))
	if((EgoVenture.state as GameState).medium_has_cutout):
		Parrot.play(preload("res://dialogs/level_medium_research_second.tres"))
	else:
		Parrot.play(preload("res://dialogs/level_medium_research_first.tres"))


func _on_NatoMessageHotspot_activate():
	Boombox.play_effect(preload("res://sounds/item_pickup.mp3"))
	get_node("NatoMessage").visible = false
	get_node("NatoMessageHotspot").visible = false
	get_node("NatoMessageHotspot").disabled = true
	(EgoVenture.state as GameState).medium_has_natomessage = true
	Inventory.add_item(preload("res://inventory/level_medium_natomessage.tres"))
	if((EgoVenture.state as GameState).medium_has_natobook):
		Parrot.play(preload("res://dialogs/level_medium_natomessage_second.tres"))
	else:
		Parrot.play(preload("res://dialogs/level_medium_natomessage_first.tres"))


func _on_CutoutHotspot_activate():
	Boombox.play_effect(preload("res://sounds/item_pickup.mp3"))
	get_node("Cutout").visible = false
	get_node("CutoutHotspot").visible = false
	get_node("CutoutHotspot").disabled = true
	(EgoVenture.state as GameState).medium_has_cutout = true
	Inventory.add_item(preload("res://inventory/level_medium_cutout.tres"))
	if((EgoVenture.state as GameState).medium_has_research):
		Parrot.play(preload("res://dialogs/level_medium_cutout_second.tres"))
	else:
		Parrot.play(preload("res://dialogs/level_medium_cutout_first.tres"))


func _on_NatoBookHotspot_activate():
	Boombox.play_effect(preload("res://sounds/item_pickup.mp3"))
	get_node("NatoBook").visible = false
	get_node("NatoBookHotspot").visible = false
	get_node("NatoBookHotspot").disabled = true
	(EgoVenture.state as GameState).medium_has_natobook = true
	Inventory.add_item(preload("res://inventory/level_medium_natobook.tres"))
	if((EgoVenture.state as GameState).medium_has_natomessage):
		Parrot.play(preload("res://dialogs/level_medium_natobook_second.tres"))
	else:
		Parrot.play(preload("res://dialogs/level_medium_natobook_first.tres"))


func _on_Hotspot_activate():
	Boombox.play_effect(preload("res://sounds/item_pickup.mp3"))
	get_node("Hotspot").visible = false
	get_node("Hotspot").disabled = true
	Inventory.add_item(preload("res://inventory/level_medium_key.tres"))
	Parrot.play(preload("res://dialogs/level_medium_key_pickup.tres"))


func _on_TriggerHotspot_item_used(item):
	if(item.title == "MediumKey" && (EgoVenture.state as GameState).medium_door_unlocked == false):
		(EgoVenture.state as GameState).medium_door_unlocked = true
		Boombox.play_effect(preload("res://sounds/unlock_door.mp3"))
		yield(Boombox,"effect_finished")
		Boombox.play_effect(preload("res://sounds/door_open.mp3"))
		Inventory.release_item()
		EgoVenture.change_scene("res://scenes/level_medium/success.tscn")


func _on_TriggerHotspot_pressed():
	yield(get_tree().create_timer(0.2), "timeout")
	if(!(EgoVenture.state as GameState).medium_door_unlocked):
		Boombox.play_effect(preload("res://sounds/door_locked.mp3"))
		Parrot.play(preload("res://dialogs/no_key.tres"))
