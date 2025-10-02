extends Area2D


var SPEED = randf_range(200, 300);
var freed = false;
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	global_position.y += SPEED*delta
	if global_position.y > 2000 and not freed:
		get_tree().get_root().get_node("level0").lose_point()
		queue_free()
		freed = true

func player_hit():
	pass


func _on_area_entered(area: Area2D) -> void:
	if area.has_method("meteor_hit"):
		$CPUParticles2D.emitting = false
		$CollisionShape2D.disabled = true
		$Kill_time.start()
		collision_layer = 2




func _on_kill_time_timeout() -> void:
	if not freed:
		queue_free()


func _on_body_entered(body: Node2D) -> void:
	body.hit_by_meteor()
