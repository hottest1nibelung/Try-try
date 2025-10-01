extends CharacterBody2D


const SPEED = 500.0
var time_spent_idle = 1
const TIME_BEFORE_IDLE_ANIMATION = 3
var facing_right = true
var stopped = true
var can_move = true
var direction
@onready var animation := $AnimatedSprite2D

func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	time_spent_idle += delta
	if int(time_spent_idle) % TIME_BEFORE_IDLE_ANIMATION == 0:
		animation.play("idle")
	
	if can_move:
		direction = Input.get_vector("left", "right", "up", "down")
	else:
		direction = Vector2.ZERO
	if direction.x:
		check_and_swtich_orientation(direction.x)
	if direction:
		time_spent_idle = 1;
		animation.play("walk")
		stopped = false
	elif not stopped:
		stopped = true
		animation.play("stopped")
	
	velocity = direction * SPEED
	move_and_slide()
	
func check_and_swtich_orientation(dir_x):
	if (facing_right and dir_x < 0) or (not facing_right and dir_x > 0):
		facing_right = !facing_right
		animation.flip_h = !animation.flip_h
