extends KinematicBody2D

export var id = 1
export var speed = 40

var screen_size

var velocity = Vector2()


func _physics_process(delta):
	velocity = Vector2()
	if Input.is_action_pressed('right_%s' % id):
		$AnimatedSprite.play("right")
		velocity.x += 1
	if Input.is_action_pressed('left_%s' % id):
		$AnimatedSprite.play("left")
		velocity.x -= 1
	if Input.is_action_pressed('up_%s' % id):
		$AnimatedSprite.play("up")
		velocity.y -= 1
	if Input.is_action_pressed('down_%s' % id):
		$AnimatedSprite.play("down")
		velocity.y += 1
	velocity = velocity.normalized() * speed

	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite.play()
	else:
		$AnimatedSprite.stop()
	position += velocity * delta
		
	velocity = move_and_slide(velocity)
