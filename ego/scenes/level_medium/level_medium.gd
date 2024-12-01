extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	Inventory.enable()
	if((EgoVenture.state as GameState).medium_has_research):
		get_node("Research").visible = false

	if((EgoVenture.state as GameState).medium_has_cutout):
		get_node("Cutout").visible = false

	if((EgoVenture.state as GameState).medium_has_natomessage):
		get_node("NatoMessage").visible = false

	if((EgoVenture.state as GameState).medium_has_natobook):
		get_node("NatoBook").visible = false



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if((EgoVenture.state as GameState).medium_can_gyufa):
		get_node("WalkHotspot2").visible = true
		get_node("WalkHotspot2").disabled = false
