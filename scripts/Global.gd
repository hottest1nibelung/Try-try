extends Node

@onready var Min_x = 25 + 200
@onready var Max_x
var current_level = 1
func _ready() -> void:
	var viewport_size = get_viewport().get_visible_rect().size
	Max_x = viewport_size.x - 25 - 200
