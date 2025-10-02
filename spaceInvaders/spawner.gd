extends Node2D


var min_time = 0.2
var max_time = 1
@onready var timer: Timer = $Timer
@onready var meteor_scene: PackedScene = load("res://scenes/meteor.tscn")

func _ready() -> void:
	timer.wait_time = randf_range(min_time, max_time)
	timer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	var meteor = meteor_scene.instantiate()
	add_child(meteor)
	meteor.global_position.x = randf_range(Global.Min_x, Global.Max_x)
