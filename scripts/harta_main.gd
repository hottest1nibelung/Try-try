extends Node2D

@onready var player: Node2D = $EnvironmentalObjects
@onready var agent: NavigationAgent2D = $EnvironmentalObjects/Player/NavigationAgent2D
@onready var target: Node2D = $Robot_NPC
@onready var dot_scene: PackedScene = load("res://dot/dot.tscn")
const DISTANCE_TO_TARGET = 50

# Pool of reusable dots
var dots_pool: Array = []

# Distance between dots in pixels
@export var dot_spacing: float = 30.0

func _ready():
	# Set initial target
	agent.target_position = target.global_position

func _process(delta):
	# Keep updating the target if it moves
	agent.target_position = target.global_position
	agent.get_next_path_position()
	# Draw path with dots
	if not agent.is_target_reached():
		draw_path()
	
	if player.global_position.distance_to(target.global_position) <= 100:
		player.can_move = false
		$Chat.show()
		$Chat.start_wrtiting()

func draw_path():
	var path = agent.get_current_navigation_path()
	if path.size() < 2:
		return

	var dot_index = 0

	# Walk through each segment of the path
	for i in range(path.size() - 1):
		var start_point = path[i]
		var end_point = path[i + 1]
		var segment = end_point - start_point
		var length = segment.length()
		var steps = int(length / dot_spacing)

		for j in range(steps + 1):
			var t = float(j) / steps if steps > 0 else 0.0
			var dot_pos = start_point.lerp(end_point, t)

			# Reuse a dot if possible, else instantiate new
			var dot
			if dot_index < dots_pool.size():
				dot = dots_pool[dot_index]
				dot.global_position = dot_pos
				dot.show()
			else:
				dot = dot_scene.instantiate()
				add_child(dot)
				dot.global_position = dot_pos
				dots_pool.append(dot)
			dot_index += 1

	# Hide any unused dots from previous frames
	for i in range(dot_index, dots_pool.size()):
		dots_pool[i].hide()

func open_chat():
	pass
