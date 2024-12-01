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


func _on_NatoMessageHotspot_activate():
	pass # Replace with function body.


func _on_CutoutHotspot_activate():
	pass # Replace with function body.


func _on_NatoBookHotspot_activate():
	pass # Replace with function body.
