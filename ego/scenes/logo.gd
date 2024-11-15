extends Control

func _ready():
	MainMenu.disabled = true
	Inventory.disable()

func to_menu():
	MainMenu.disabled = false
	EgoVenture.change_scene("res://scenes/menu.tscn")
