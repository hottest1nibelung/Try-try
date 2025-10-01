extends Node2D


@export var radius: float = 4.0
@export var color: Color = Color(0.657, 0.508, 0.249, 0.416)

func _draw() -> void:
	draw_circle(Vector2(0, 0), radius, color)

func _ready() -> void:
	_draw()
