extends AnimatedSprite2D

@onready var light := get_tree().get_root().get_node("Main Menu").get_node("PointLight2D")
var playing = false
const MIN_DIST_LIGHT = 60
func _ready() -> void:
	frame = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if self.global_position.distance_to(light.global_position) < MIN_DIST_LIGHT and not playing:
		play("decoleaza")
		playing = true
	pass




func _on_animation_finished() -> void:
	frame = 0
	print("da")
	playing = false
