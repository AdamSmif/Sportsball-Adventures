extends CanvasLayer

var bottles = 0
# Next Level For Bottle Colelcting Levels
export(String, FILE, "*.tscn") var bottle_world_scene

var hearts = 4 setget set_hearts
var max_hearts = 4 setget set_max_hearts

onready var label = $HealthUI

func set_hearts(value):
	hearts = clamp(value, 0, max_hearts)
	if label != null:
		label.text = str(hearts)
	
func set_max_hearts(value):
	max_hearts = max(value, 1)

func _ready():
	$Bottles.text = String(bottles)
	self.max_hearts = PlayerStats.max_health
	self.hearts = PlayerStats.health
	PlayerStats.connect("health_changed", self, "set_hearts")

func _physics_process(delta):
		if bottles == 8:
			get_tree().change_scene(bottle_world_scene)


func _on_bottle_collected():
	bottles = bottles + 1
	_ready()


func _on_Bottle_body_entered(body):
	bottles = bottles + 1
	_ready()


func _on_Bottle_bottle_collected():
	bottles = bottles + 1
	_ready()
