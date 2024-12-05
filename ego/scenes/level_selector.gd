extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	EgoVenture.save_continue()
	if(Boombox.is_music_playing()):
		if(Boombox.get_music().get_length() != preload("res://music/main_menu.mp3").get_length()):
			Boombox.play_music(preload("res://music/main_menu.mp3"))
	else:
		Boombox.play_music(preload("res://music/main_menu.mp3"))
	if(!(EgoVenture.state as GameState).easy_done):
		get_node("TextureButton3").modulate = Color(0.5,0.5,0.5,1)
		get_node("TextureButton3/MapHotspot").disabled = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_pressed():
	#EgoVenture.change_scene("res://scenes/level_tutorial/intro.tscn")
	(EgoVenture.state as GameState).tutorial_seen_door = false
	(EgoVenture.state as GameState).tutorial_has_note = false
	(EgoVenture.state as GameState).tutorial_done = false
	(EgoVenture.state as GameState).tutorial_unlocked_door = false
	(EgoVenture.state as GameState).tutorial_seen_rightside = false

func _on_Button2_pressed():
	#if(get_node("TextureButton2").modulate == Color(1,1,1,1)):
		#EgoVenture.change_scene("res://scenes/level_easy/level_easy.tscn")
	(EgoVenture.state as GameState).easy_done = false
	(EgoVenture.state as GameState).easy_flag = false
	(EgoVenture.state as GameState).easy_has_key = false
	(EgoVenture.state as GameState).easy_has_coded_message = false
	(EgoVenture.state as GameState).easy_has_number_code = false


func _on_Button3_pressed():
	if(get_node("TextureButton3").modulate == Color(1,1,1,1)):
		#EgoVenture.change_scene("res://scenes/level_medium/level_medium.tscn")
		get_node("TextureButton3/MapHotspot").disabled = false
		(EgoVenture.state as GameState).medium_can_gyufa = false
		(EgoVenture.state as GameState).medium_can_labtorlo = false
		(EgoVenture.state as GameState).medium_done = false
		(EgoVenture.state as GameState).medium_door_unlocked = false
		(EgoVenture.state as GameState).medium_has_key = false
		(EgoVenture.state as GameState).medium_has_mainmessage1 = false
		(EgoVenture.state as GameState).medium_has_mainmessage2 = false
		(EgoVenture.state as GameState).medium_has_natobook = false
		(EgoVenture.state as GameState).medium_has_natomessage = false
		(EgoVenture.state as GameState).medium_has_periodic = false
		(EgoVenture.state as GameState).medium_has_research = false
	else:
		get_node("TextureButton3/MapHotspot").disabled = true


func _on_TextureButton4_pressed():
	MainMenu.toggle()



func _on_MapHotspot_activate():
	(EgoVenture.state as GameState).medium_can_gyufa = false
	(EgoVenture.state as GameState).medium_can_labtorlo = false
	(EgoVenture.state as GameState).medium_done = false
	(EgoVenture.state as GameState).medium_door_unlocked = false
	(EgoVenture.state as GameState).medium_has_key = false
	(EgoVenture.state as GameState).medium_has_mainmessage1 = false
	(EgoVenture.state as GameState).medium_has_mainmessage2 = false
	(EgoVenture.state as GameState).medium_has_natobook = false
	(EgoVenture.state as GameState).medium_has_natomessage = false
	(EgoVenture.state as GameState).medium_has_periodic = false
	(EgoVenture.state as GameState).medium_has_research = false

