extends Node

@onready var Min_x = $CollisionShape2D.shape.radius + 200
@onready var Max_x = get_viewport_rect().size.x - $CollisionShape2D.shape.radius - 200
var current_level = 1
