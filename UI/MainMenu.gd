extends MarginContainer

const first_scene = preload("res://Levels/Locker/LockerRoom.tscn")

onready var selector_one = $CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/CenterContainer/HBoxContainer/Selector
onready var selector_two = $CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/CenterContainer2/HBoxContainer/Selector
onready var selector_three = $CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/CenterContainer3/HBoxContainer/Selector

var current_selection = 0

# current selector 0 starts at start, 1 is options, ect

func _ready():
	set_current_selection(0)

func _process(delta):
	if Input.is_action_just_pressed("ui_down") and current_selection < 2:
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
		get_parent().add_child(first_scene.instance())
		queue_free()
	elif _current_selection == 1: # options
		print("Add options!")
	elif _current_selection == 2: # exit
		get_tree().quit()

func set_current_selection(_current_selection):
	selector_one.text = ""
	selector_two.text = ""
	selector_three.text = ""
	if _current_selection == 0:
		selector_one.text = ">"
	elif _current_selection == 1:
		selector_two.text = ">"
	elif _current_selection == 2:
		selector_three.text = ">"
