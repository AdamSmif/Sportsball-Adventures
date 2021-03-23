extends MarginContainer

#To Start Game
export(String, FILE, "*.tscn") var next_world_scene

#To Credits
export(String, FILE, "*.tscn") var to_credits_scene

#To Options
export(String, FILE, "*.tscn") var to_options_scene

#To Minigames
export(String, FILE, "*.tscn") var to_minigames_scene

onready var selector_one = $CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/CenterContainer/HBoxContainer/Selector
onready var selector_two = $CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/CenterContainer2/HBoxContainer/Selector
onready var selector_three = $CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/CenterContainer3/HBoxContainer/Selector
onready var selector_four = $CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/CenterContainer4/HBoxContainer/Selector
onready var selector_five = $CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/CenterContainer5/HBoxContainer/Selector
#onready var selector_six = $CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/CenterContainer6/HBoxContainer/Selector


var current_selection = 0

# current selector 0 starts at start

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
		$AnimationPlayer.play("fade")
		yield(get_tree().create_timer(1), "timeout")
		handle_selection(current_selection)

func handle_selection(_current_selection):
	if _current_selection == 0: # start
		$YSort/Start.stop()
		yield(get_tree().create_timer(1), "timeout")
		get_tree().change_scene(next_world_scene)
		queue_free()
	elif _current_selection == 1: # load
		$YSort/Start.stop()
		yield(get_tree().create_timer(1), "timeout")
		get_tree().change_scene(next_world_scene)
		queue_free()
	elif _current_selection == 2: # Mini Games
		$YSort/Start.stop()
		yield(get_tree().create_timer(1), "timeout")
		get_tree().change_scene(to_minigames_scene)
		queue_free()
	elif _current_selection == 3: # option
		$YSort/Start.stop()
		yield(get_tree().create_timer(1), "timeout")
		get_tree().change_scene(to_options_scene)
		queue_free()
	elif _current_selection == 4: # Credit
		$YSort/Start.stop()
		yield(get_tree().create_timer(1), "timeout")
		get_tree().change_scene(to_credits_scene)
		queue_free()
	elif _current_selection == 5: # exit
		get_tree().quit()

func set_current_selection(_current_selection):
	selector_one.text = ""
	selector_two.text = ""
	selector_three.text = ""
	selector_four.text = ""
	selector_five.text = ""
#	selector_six.text = ""
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
	elif _current_selection == 5:
		selector_five.text = ">"
#	elif _current_selection == 6:
#		selector_six.text = ">"
