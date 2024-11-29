# This is the game state. It represents the player's progress
# in the game
class_name GameState
extends BaseState

# Define additional variables here, that document the
# player's progress

## The player has taken the keys
#export(bool) var has_keys = false
export(bool) var tutorial_seen_door = false
export(bool) var tutorial_seen_rightside = false
export(bool) var tutorial_has_note = false
export(bool) var tutorial_unlocked_door = false
export(bool) var tutorial_done = false
export(bool) var easy_has_coded_message = false
export(bool) var easy_has_number_code = false
export(bool) var easy_done = false
