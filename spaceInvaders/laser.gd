extends Area2D

var SPEED = 500 
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	global_position.y -= SPEED * delta
	if global_position.y < -100 :
		queue_free()
