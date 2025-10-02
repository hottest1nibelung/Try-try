extends CharacterBody2D

@onready var Min_x = $CollisionShape2D.shape.radius + 200
@onready var Max_x = get_viewport_rect().size.x - $CollisionShape2D.shape.radius - 200
@onready var laserscene: PackedScene = load("res://spaceInvaders/laser.tscn")
const SPEED = 300.0

func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	var mouse_pos = get_global_mouse_position().x
	if mouse_pos >= Min_x and mouse_pos <= Max_x:
		global_position.x = get_global_mouse_position().x
	if Input.is_action_just_pressed("clickstanga"):
		var laser = laserscene.instantiate()
		get_tree().get_root().get_node("level0").add_child(laser)
		laser.global_position = self.global_position
