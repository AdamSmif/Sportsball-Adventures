extends KinematicBody2D

export var id = 0
export var speed = 100

var velocity = Vector2()
var bullet = preload("res://MiniGames/DrivingRangeMiniGameCode/GolfBall/GolfballMiniGame.tscn")


# Attack variables
var fire_cooldown_time = 1000
var next_fire_time = 0

#Cool Down
onready var CoolDown = $CoolDown
export var swingDelay: float = 0.1

func _ready():
	set_process(true)
	set_physics_process(true)
	
func _process(delta):
	velocity = Vector2()
	if Input.is_action_just_pressed("throwright_%s" % id) and CoolDown.is_stopped():
		Input.action_release("left_%s" % id)
		Input.action_release("right_%s" % id)
		$AnimatedSprite.play("fire")
		CoolDown.start(swingDelay)
		#spawn bullet
		var bulletInstance = bullet.instance()
		bulletInstance.position = $Position2D.global_position
		get_tree().get_root().add_child(bulletInstance)

	if Input.is_action_pressed('right_%s' % id):
		$AnimatedSprite.play("right")
		velocity.x += 1
	if Input.is_action_pressed('left_%s' % id):
		$AnimatedSprite.play("left")
		velocity.x -= 1
#	if Input.is_action_pressed('up_%s' % id):
#		$AnimatedSprite.play("up")
#		velocity.y -= 1
#	if Input.is_action_pressed('down_%s' % id):
#		$AnimatedSprite.play("down")
#		velocity.y += 1
#	else:
#		$AnimatedSprite.play("idle")
	velocity = velocity.normalized() * speed
	
	
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite.play()
	else:
		$AnimatedSprite.stop()
	position += velocity * delta

func _physics_process(delta):
	velocity = move_and_slide(velocity)

# Cool Down For Golf Shots
func _on_CoolDown_timeout():
	pass # Replace with function body.
