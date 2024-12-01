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
#func _process(delta):
#	pass


func _on_ResearchHotspot_activate():
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
	get_node("NatoBook").visible = false
	get_node("NatoBookHotspot").visible = false
	get_node("NatoBookHotspot").disabled = true
	(EgoVenture.state as GameState).medium_has_natobook = true
	Inventory.add_item(preload("res://inventory/level_medium_natobook.tres"))
	if((EgoVenture.state as GameState).medium_has_natomessage):
		Parrot.play(preload("res://dialogs/level_medium_natobook_second.tres"))
	else:
		Parrot.play(preload("res://dialogs/level_medium_natobook_first.tres"))
