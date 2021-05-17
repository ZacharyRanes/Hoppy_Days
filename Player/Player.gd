extends KinematicBody2D

var motion = Vector2(0,0)

const UP = Vector2(0,-1)
const GRAVITY = 300
const SPEED = 1500
const JUMP_SPEED = 5000

signal animate

func _physics_process(delta):
	apply_gravity()
	jump()
	move()
	animate()
	move_and_slide(motion, UP)

func apply_gravity():
	if is_on_floor():
		motion.y = 0
	else:
		motion.y += GRAVITY
		
func jump():
	if Input.is_action_pressed("Jump") and is_on_floor():
		motion.y -= JUMP_SPEED
		
func move():
	if Input.is_action_pressed("Left") and not Input.is_action_pressed("Right"):
		motion.x = -SPEED
	elif Input.is_action_pressed("Right") and not Input.is_action_pressed("Left"):
		motion.x = SPEED
	else:
		motion.x = 0

func animate():
	emit_signal("animate", motion)

