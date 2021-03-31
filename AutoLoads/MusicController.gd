extends Node

var rain_music = load("res://Music/RainShowersRVX2406.ogg")
var menu_music = load("res://Music/the_past_8_bit_lofi_.ogg")
var credits_music = load("res://Music/8_bit_cold_lake_lofi.ogg")

func _ready():
	pass
	
func play_rain_music():
	$Music.stream = rain_music
	$Music.play()
	
func stop_rain_music():
	$Music.stream = rain_music
	$Music.stop()

func play_menu_music():
	$Music.stream = menu_music
	$Music.play()
	
func stop_menu_music():
	$Music.stream = menu_music
	$Music.stop()
	
func play_credits_music():
	$Music.stream = credits_music
	$Music.play()
	
func stop_credits_music():
	$Music.stream = credits_music
	$Music.stop()
	
