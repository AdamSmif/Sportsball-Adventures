extends KinematicBody2D

export var id = 1
const MAX_SPEED = 75
const ACCELERATION = 30

# Score 
var score = 0

var velocity = Vector2()

func _physics_process(delta):
	velocity = Vector2()
	if Input.is_action_pressed('right_%s' % id):
		$Sprite.flip_h = false
		$Sprite.play("right")
		velocity.x += 1
	if Input.is_action_pressed('left_%s' % id):
		$Sprite.flip_h = true
		$Sprite.play("right")
		velocity.x -= 1
	if Input.is_action_pressed('up_%s' % id):
		$Sprite.play("up")
		velocity.y -= 1
	if Input.is_action_pressed('down_%s' % id):
		$Sprite.play("down")
		velocity.y += 1
	velocity = velocity.normalized() * MAX_SPEED

	
	
	if velocity.length() > 0:
		velocity = velocity.normalized() * MAX_SPEED
		$Sprite.play()
	else:
		$Sprite.stop()
	position += velocity * delta

	velocity = move_and_slide(velocity)
	
func _on_Bottle_body_entered(_delta):
	$CoinSound.play()
	score += 1
	print(score)
