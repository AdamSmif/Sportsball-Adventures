extends MarginContainer

#To Start Game
export(String, FILE, "*.tscn") var main_menu_scene

#To Credits
export(String, FILE, "*.tscn") var to_credits_scene

#To Options
export(String, FILE, "*.tscn") var to_options_scene

onready var selector_one = $CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/CenterContainer/HBoxContainer/Selector
onready var selector_two = $CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/CenterContainer2/HBoxContainer/Selector
onready var selector_three = $CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/CenterContainer3/HBoxContainer/Selector
onready var selector_four = $CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/CenterContainer4/HBoxContainer/Selector
onready var selector_five = $CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/CenterContainer5/HBoxContainer/Selector

var current_selection = 0

# current selector 0 starts at start, 1 is options, ect

func _ready():
	set_current_selection(0)

func _process(delta):
	if Input.is_action_just_pressed("ui_down") and current_selection < 4:
		$YSort/Select.play()
		current_selection += 1
		set_current_selection(current_selection)
	elif Input.is_action_just_pressed("ui_up") and current_selection > 0:
		current_selection -= 1
		$YSort/Select.play() 
		set_current_selection(current_selection)
	elif Input.is_action_just_pressed("ui_accept"):
		$YSort/Start.play()
#		$AnimationPlayer.play("fade")
		yield(get_tree().create_timer(1), "timeout")
		handle_selection(current_selection)

func handle_selection(_current_selection):
	if _current_selection == 0: # Full Screen
		$YSort/Start.stop()
		OS.set_window_fullscreen(!OS.window_fullscreen)
	elif _current_selection == 1: # Audio
		$YSort/Start.stop()
		AudioServer.set_bus_mute(AudioServer.get_bus_index("Master"), true)   
	elif _current_selection == 2: # option
		$YSort/Start.stop()
		yield(get_tree().create_timer(1), "timeout")
		get_tree().change_scene(to_options_scene)
		queue_free()
	elif _current_selection == 3: # Credit
		$YSort/Start.stop()
		yield(get_tree().create_timer(1), "timeout")
		get_tree().change_scene(to_credits_scene)
		queue_free()
	elif _current_selection == 4: # exit
		$YSort/Start.stop()
		yield(get_tree().create_timer(1), "timeout")
		get_tree().change_scene(main_menu_scene)
		queue_free()

func set_current_selection(_current_selection):
	selector_one.text = ""
	selector_two.text = ""
	selector_three.text = ""
	selector_four.text = ""
	selector_five.text = ""
	if _current_selection == 0:
		selector_one.text = ">"
	elif _current_selection == 1:
		selector_two.text = ">"
	elif _current_selection == 2:
		selector_three.text = ">"
	elif _current_selection == 3:
		selector_four.text = ">"
	elif _current_selection == 4:
		selector_five.text = ">"
