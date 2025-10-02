extends Area2D

var SPEED = 500 
@onready var animation: AnimatedSprite2D = $AnimatedSprite2D
var freed = false

func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	global_position.y -= SPEED * delta
	if global_position.y < -100 :
		queue_free()

func meteor_hit():
	pass


func _on_area_entered(area: Area2D) -> void:
	#daca loveste meteoritul
	if area.has_method("player_hit") and not freed:
		get_parent().laser_hit_enemy()
		freed = true
		animation.play("hit")
		print("yes")
		$CollisionShape2D.queue_free()


func _on_animated_sprite_2d_animation_finished() -> void:
	if not freed:
		queue_free()
