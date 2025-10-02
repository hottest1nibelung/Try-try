extends CharacterBody2D

@onready var animation: AnimatedSprite2D = $AnimatedSprite2D
@onready var laserscene: PackedScene = load("res://spaceInvaders/laser.tscn")
@onready var lvl = get_tree().get_root().get_node("level0")
@onready var player = lvl.get_node("Drona")
const SPEED = 300.0

func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	var mouse_pos = get_global_mouse_position().x
	if mouse_pos >= Global.Min_x and mouse_pos <= Global.Max_x:
		global_position.x = get_global_mouse_position().x
	if Input.is_action_just_pressed("clickstanga"):
		animation.play("attack")
		var laser = laserscene.instantiate()
		get_tree().get_root().get_node("level0").add_child(laser)
		laser.global_position = self.global_position

func hit_by_meteor():
	get_tree().get_root().get_node("level0").lose_point()
