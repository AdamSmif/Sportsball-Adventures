extends Node

#var battle_music = load("res://resources/audio/Fight.ogg")
#var basic_music = load("res://resources/audio/Basic.ogg")
var song1 = load("res://Music/Holidayz2.wav")

func _ready():
	pass
	
func play_song1():
	$Music.stream = song1
	$Music.play()
#func play_battle_music():
#	$Music.stream = battle_music
#	$Music.play()
#
#func play_basic_music():
#	$Music.stream = basic_music
#	$Music.play()
#
#func turn_down_volume():
#	$Music.volume_db = -12
#
#func reset_volume():
#	$Music.volume_db = 0
